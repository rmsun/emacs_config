;;for dired
(setq dired-recursive-deletes t) ; 可以递归的删除目录
(setq dired-recursive-copies t) ; 可以递归的进行拷贝
;;thumbs
(autoload 'thumbs "thumbs" "Preview images in a directory." t)
(put 'dired-find-alternate-file 'disabled nil)
