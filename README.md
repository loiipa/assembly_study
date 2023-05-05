# assembly_study

## intel mac 기준 설치 및 실행
### nasm 설치 (homebrew)
```
brew install nasm
```

### 실행
```
nasm -f macho64 [filename].s
gcc -o [filename] [filename].o
./[filename]
```

## 참고 사이트
- https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/x64-architecture
- https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master
