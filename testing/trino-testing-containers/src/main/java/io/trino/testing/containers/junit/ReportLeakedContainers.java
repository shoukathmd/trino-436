/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package io.trino.testing.containers.junit;

import com.github.dockerjava.api.DockerClient;
import com.github.dockerjava.api.model.Container;
import io.airlift.log.Logger;
import org.junit.platform.launcher.TestExecutionListener;
import org.junit.platform.launcher.TestPlan;
import org.testcontainers.DockerClientFactory;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import static com.google.common.base.MoreObjects.toStringHelper;
import static com.google.common.collect.ImmutableList.toImmutableList;
import static java.lang.Boolean.getBoolean;
import static java.util.Objects.requireNonNull;
import static java.util.stream.Collectors.joining;

public final class ReportLeakedContainers
{
    private ReportLeakedContainers() {}

    private static final Logger log = Logger.get(ReportLeakedContainers.class);
    private static final boolean DISABLED = getBoolean("ReportLeakedContainers.disabled");

    private static final Set<String> ignoredIds = Collections.synchronizedSet(new HashSet<>());

    public static void ignoreContainerId(String containerId)
    {
        ignoredIds.add(requireNonNull(containerId, "containerId is null"));
    }

    // Separate class so that ReportLeakedContainers.ignoreContainerId can be called without pulling junit platform onto classpath
    public static class Listener
            implements TestExecutionListener
    {
        @Override
        public void testPlanExecutionFinished(TestPlan testPlan)
        {
            if (DISABLED) {
                log.info("ReportLeakedContainers disabled");
                return;
            }
            log.info("Checking for leaked containers");

            @SuppressWarnings("resource") // Throws when close is attempted, as this is a global instance.
            DockerClient dockerClient = DockerClientFactory.lazyClient();

            List<Container> containers = dockerClient.listContainersCmd()
                    .withLabelFilter(Map.of(DockerClientFactory.TESTCONTAINERS_SESSION_ID_LABEL, DockerClientFactory.SESSION_ID))
                    .exec()
                    .stream()
                    .filter(container -> !ignoredIds.contains(container.getId()))
                    .collect(toImmutableList());

            if (!containers.isEmpty()) {
                log.error("Leaked containers: %s", containers.stream()
                        .map(container -> toStringHelper("container")
                                .add("id", container.getId())
                                .add("image", container.getImage())
                                .add("imageId", container.getImageId())
                                .toString())
                        .collect(joining(", ", "[", "]")));

                // JUnit does not fail on a listener exception.
                System.err.println("JVM will be terminated");
                System.exit(1);
            }
        }
    }
}
