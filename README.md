# Docker for JupyterLab

Dockerで立ち上がるオレオレJupyterLab環境

## usage
```
$dc up --build
```

## install [kite](https://github.com/kiteco/jupyterlab-kite)
```
$ bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"
$ pip install jupyter-kite
$ jupyter labextension install "@kiteco/jupyterlab-kite"
```

## install [code_formatter](https://jupyterlab-code-formatter.readthedocs.io/en/latest/installation.html#installation-step-1-installing-the-plugin-itself)

```
jupyter labextension install @ryantam626/jupyterlab_code_formatter
pip install jupyterlab_code_formatter
pip install --upgrade jupyterlab_code_formatter
jupyter serverextension enable --py jupyterlab_code_formatter
```
