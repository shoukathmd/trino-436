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
package io.trino.hive.formats.avro;

import io.trino.spi.block.Block;
import io.trino.spi.block.BlockBuilder;
import io.trino.spi.type.Type;
import org.apache.avro.Schema;

import java.util.Map;
import java.util.Optional;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;

public class NoOpAvroTypeManager
        implements AvroTypeManager
{
    public static final NoOpAvroTypeManager INSTANCE = new NoOpAvroTypeManager();

    private NoOpAvroTypeManager() {}

    @Override
    public void configure(Map<String, byte[]> fileMetadata) {}

    @Override
    public Optional<Type> overrideTypeForSchema(Schema schema)
            throws AvroTypeException
    {
        return Optional.empty();
    }

    @Override
    public Optional<BiConsumer<BlockBuilder, Object>> overrideBuildingFunctionForSchema(Schema schema)
            throws AvroTypeException
    {
        return Optional.empty();
    }

    @Override
    public Optional<BiFunction<Block, Integer, Object>> overrideBlockToAvroObject(Schema schema, Type type)
            throws AvroTypeException
    {
        return Optional.empty();
    }
}
