#!/bin/bash
CURDIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )

echo "当前目录为：${CURDIR}"

read -p "请输入文件目录地址(必须绝对路径，结尾不用加\"/\")" dir_name

echo "您输入的目录为：${dir_name}"

read -p "请输入要筛选的文件后戳名（例如txt、docx...好像有些文件类型不行）" file_name
echo "搜索到\"${dir_name}\"目录下，后戳名为\"${file_name}\"的文件如下："

readonly arr_name="${dir_name}/*.${file_name}"

for file in $arr_name;
do
  echo $file
done

read -p "是否将这些文件复制到桌面单独文件夹？（确认请输入\"y\"，否则请按\"回车\"跳过）" isdir

if [[ $isdir = "y" ]]
then

  read -p "请输入目录名（必须字母和下划线开头）：" dn

  dire="/Users/andy/Desktop/${dn}"

  if [ -d "$dire" ]; then
    rmdir "$dire"
    mkdir "$dire"
  else
    mkdir "$dire"
  fi

  for file in $arr_name;
  do
     cp $file "${dire}"
  done
  
  echo "<h1 style=\"text-align:center;color:#66CCFF;\">Hi！觉得好用吗？</h1><h2 style=\"text-align:center;color:#66CCFF;\">好用的话请关注我的微博，关注我的人计算机一般不会挂科 🚀 🚀 🚀</h2><h4 style=\"text-align:center;color:#66CCFF;\">微博：<a href=\"http://weibo.com/zzlwte\">http://weibo.com/zzlwte</a></h4><h4 style=\"text-align:center;color:#66CCFF;\">微信：liang68866</h4><h4 style=\"text-align:center;color:#66CCFF;\">个人网站：<a href=\"http://baby925.top\">http://baby925.top</a></h4>" > "${dire}/关于我.html"
	
  open $dire
fi


echo "额，目录给亲整理好了，谢谢使用"
