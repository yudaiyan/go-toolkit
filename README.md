# go-toolkit
这个项目用于自动管理使用到的依赖。

# 使用
在使用的项目的恰当位置添加以下依赖项，以在go.mod强制保留go-toolkit
```golang
import (
	_ "github.com/yudaiyan/go-toolkit"
)
```
就不需要一个个管理go-toolkit所引入的依赖版本，而是只需要管理go-toolkit的版本即可。