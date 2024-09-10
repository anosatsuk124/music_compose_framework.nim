# music_compose_framework.nim

An MML music composing macro framework for Nim.

## Examples

```nim
defScore Part1:
  n:
    "l8 o5"
    "dd {dd}{cc}dd d{ff}gg gffg dd2"
  n 2: "dd{ff}a bbb{ff}ga"

Part1()
```

It will generate the following (MML code) output:

```txt
l8 o5
dd {dd}{cc}dd d{ff}gg gffg dd2
dd{ff}a bbb{ff}ga
dd{ff}a bbb{ff}ga
```

## License Information

```
Copyright 2024 Satsuki Akiba<anosatsuk124@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
