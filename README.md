# Hotpot doesn't properly transpile files with kebab-case names

This issue is about Hotpot not transpiling properly files with names that are
in kebab-case (e.g. `module-in-kebab-case`). You can see in the following image
that the file is transpiled to a directory instead of a lua file.

![image](https://user-images.githubusercontent.com/37723586/159521661-519d6c45-9d8e-4fb6-a4d3-b63e7dfbd184.png)

This makes neovim crash with a file not found error.

## How to reproduce the issue

**Note:** this method of reproduction requires the use of Docker.

Execute the following command in the terminal:

```shell
docker build -t hotpot-issue . && docker run -it hotpot-issue
```

After that execute Neovim:

```shell
nvim
```

After that you can check if the file is a directory using the following command:

```shell
ls -la ~/.cache/nvim/hotpot/root/.config/nvim/fnl/core
```

## Expected result

Neovim mustn't crash because the file is compiled into a directory.

## Current result

Neovim is crashing as the file is currently being compiled into a directory.
