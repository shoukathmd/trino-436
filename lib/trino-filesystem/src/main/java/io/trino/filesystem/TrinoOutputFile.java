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

package io.trino.filesystem;

import io.airlift.slice.Slice;
import io.trino.memory.context.AggregatedMemoryContext;

import java.io.IOException;
import java.io.OutputStream;

import static io.trino.memory.context.AggregatedMemoryContext.newSimpleAggregatedMemoryContext;

public interface TrinoOutputFile
{
    default OutputStream create()
            throws IOException
    {
        return create(newSimpleAggregatedMemoryContext());
    }

    default OutputStream createOrOverwrite()
            throws IOException
    {
        return createOrOverwrite(newSimpleAggregatedMemoryContext());
    }

    /**
     * Create file exclusively and atomically with specified contents.
     */
    default void createExclusive(Slice content)
            throws IOException
    {
        createExclusive(content, newSimpleAggregatedMemoryContext());
    }

    OutputStream create(AggregatedMemoryContext memoryContext)
            throws IOException;

    OutputStream createOrOverwrite(AggregatedMemoryContext memoryContext)
            throws IOException;

    /**
     * Create file exclusively and atomically with specified contents.
     */
    default void createExclusive(Slice content, AggregatedMemoryContext memoryContext)
            throws IOException
    {
        throw new UnsupportedOperationException("createExclusive not supported by " + getClass());
    }

    Location location();
}
