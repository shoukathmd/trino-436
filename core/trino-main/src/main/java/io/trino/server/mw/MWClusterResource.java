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
package io.trino.server.mw;

import com.google.inject.Inject;
import io.airlift.node.NodeInfo;
import io.trino.client.NodeVersion;
import io.trino.server.security.ResourceSecurity;
import io.trino.server.ui.ClusterResource;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;

import static io.trino.server.security.ResourceSecurity.AccessType.PUBLIC;

@Path("/ui/api/trino-cluster-resource")
public class MWClusterResource
{
    private final NodeVersion version;
    private final String environment;
    private final ClusterResource clusterResource;
    private final long startTime = System.nanoTime();

    @Inject
    public MWClusterResource(NodeVersion nodeVersion, NodeInfo nodeInfo, ClusterResource clusterResource)
    {
        this.version = nodeVersion;
        this.environment = nodeInfo.getEnvironment();
        this.clusterResource = clusterResource;
    }

    @GET
    @Produces("application/json")
    @ResourceSecurity(PUBLIC)
    public ClusterResource.ClusterInfo getInfo()
    {
        return this.clusterResource.getInfo();
    }
}
