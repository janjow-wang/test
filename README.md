# test

test code using [Unity](https://github.com/ThrowTheSwitch/Unity)

## structure

- `build` - obj files
- `src` - source code
- `test` - test cases
- `unity` - unity framework from [Unity](https://github.com/ThrowTheSwitch/Unity)


## run

for unitest program

```bash
$ make test
```
will generate test_app elf file under build directory


for normal program

```bash
$ make
```
will generate app elf file under build directory


To clean:

```bash
$ make clean
```
will remove all files under build directory

## CI

make test and make will be invoked after git push by github actions
- .github/workflows/c-cpp.yml


