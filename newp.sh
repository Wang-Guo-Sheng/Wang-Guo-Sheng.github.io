#!/bin/sh
# Add new post.
# Example:
# newp book "The Time of the Heroes" "https://asiasuptour.org/wp-content/uploads/2019/10/placeholder.png" llosa barsas

currdir=`pwd`
rootdir=${0%/*}
cd ${rootdir}
git pull -ff-only

title=$2
imgurl=$3
tags=${@:4:99}

case $1 in
"book")
    page="book"
    categ="读书"
    ;;
"fantasy")
    page="fantasy"
    categ="梦呓"
    ;;
"phil")
    page="phil"
    categ="致理"
    ;;
"phys")
    page="phys"
    categ="格物"
    ;;
"road")
    page="road"
    categ="路途"
    ;;
"tech")
    page="tech"
    categ="技术"
    ;;
*)
    echo "Error Invalid Category" 1>&2
    exit 64
esac

datetime=`date +%Y-%m-%d\ %H:%M`
filedate=`date -d "${datetime}" +%Y-%m-%d`
filetitle="${title// /-}"
fbasename="${filedate}-${filetitle}"
postpath="${0%/*}/_posts/${page}/${fbasename}.md"

yaml=("---"
    "layout: blog"
    "istop: false"
    "${page}: true"
    "title: \"${title}\""
    "background-image: \"${imgurl}\""
    "date: ${datetime}"
    "category: ${categ}"
    "tags:")

for tag in ${tags[@]}; do
    yaml=("${yaml[@]}" "- ${tag}")
done

yaml=("${yaml[@]}" "---")

for y in "${yaml[@]}"; do
    echo ${y} | tee -a ${postpath}
done

smerge ${rootdir}
xdg-open ${postpath}
cd ${currdir}
