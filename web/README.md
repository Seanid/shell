#静态页面发布脚本

这个脚本主要是用于静态博客发布，原本放在github上面的博客迁移到自己的服务器上后，每次写一篇博客就需要重新上传，后面就想着利用自建的git服务器和脚本，实现博客文章深夜的自动发布功能，这个脚本就是实现自动发布使用的。

使用思路：将脚本放在nginx所在服务器上，定时git pull 静态博客的内容下来，copy到nginx提前设定好的目录下


使用

~~~

	chmod +x deploy.sh
	sudo ./install.sh git_url nginx_web_path

	实例：
	sudo ./install.sh http://username:password@git.com/master/blog.git /usr/local/www/blog

~~~


