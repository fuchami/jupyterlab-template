# Docker for JupyterLab

Dockerで立ち上がるオレオレJupyterLab環境

## jupyterlab 起動方法
```
$docker-compose up --build
```

## vimキーバインドを無効化したい場合
requirements.txtの下記箇所をコメントアウトしてください。

```
jupyterlab_vim~=0.14.5
jupyterlab-vimrc~=0.5.2
```