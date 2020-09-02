# go-echarts的基本使用

## 1 基本介绍

ECharts，一个使用 JavaScript 实现的开源可视化库，可以流畅的运行在 PC 和移动设备上，兼容当前绝大部分浏览器（IE8/9/10/11，Chrome，Firefox，Safari等），底层依赖矢量图形库 [ZRender](https://github.com/ecomfe/zrender)，提供直观，交互丰富，可高度个性化定制的数据可视化图表。

## 2 使用

使用比较多的是pyecharts，能够将python和echarts结合，用python代码生成echarts图形。

对应的Go版本就是go-echarts，安装

`go get github.com/go-echarts/go-echarts/...`



官方例子

```go
package main

import (
   "github.com/go-echarts/go-echarts/charts"
   "log"
   "os"
)

func main()  {
   nameItems := []string{"A", "B", "C"}
   bar := charts.NewBar()
   bar.SetGlobalOptions(charts.TitleOpts{Title: "Bar-实例图"}, charts.ToolboxOpts{Show: true})
   bar.AddXAxis(nameItems).
      AddYAxis("商家", []int{20, 40, 60}).
      AddYAxis("商家B", []int{35, 14, 25})
   f, err := os.Create("bar.html")
   if err != nil {
      log.Println(err)
   }
   if err := bar.Render(f); err != nil {
      log.Println(err)
   }
}
```

然后运行

`go run main.go`

就会看到本地生成的bar.html，用浏览器打开就会看图表，真的是非常便捷



## 3 待解决问题

echarts生成html格式，经过浏览器渲染才能看到展示图片，不支持后台直接导出图片。在此情况下，可以考虑其他方案：

1.  使用其他工具从html中模仿JS解释图片
2.  使用类似python的matplot的工具



