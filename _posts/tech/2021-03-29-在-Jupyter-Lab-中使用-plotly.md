---
layout: blog
istop: false
tech: true
title: "在 Jupyter Lab 中使用 plotly"
background-image: style/img/md/output_2_1.png
date: 2021-03-29 17:50
category: 技术
tags:
- python
- plotly
---

直接使用无法在 jupyter-notebook 中显示图窗，安装插件`jupyterlab-plotly`后可用。

### 安装

```bash
conda install nodejs
jupyter labextension install jupyterlab-plotly
```

[1]: https://stackoverflow.com/questions/52771328/plotly-chart-not-showing-in-jupyter-notebook

### 使用

```python
import plotly.graph_objects as go
fig = go.Figure(data=go.Bar(y=[2, 3, 1]))
fig.show()
```

![output](../../../style/img/md/output_2_1.png)
