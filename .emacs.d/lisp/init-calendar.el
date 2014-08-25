;;设置日历的一些颜色
(setq calendar-load-hook
'(lambda ()
(set-face-foreground 'diary-face "skyblue")
(set-face-background 'holiday-face "slate blue")
(set-face-foreground 'holiday-face "white")))

;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

;; 设置 calendar 的显示
(setq calendar-remove-frame-by-deleting t)

;;设置星期一为每周的第一天
(setq calendar-week-start-day 1) 

;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
;; 在这里，可以把家人还有朋友的生日写上
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '((holiday-fixed 1 1 "元旦")
(holiday-fixed 2 14 "情人节")
(holiday-fixed 3 14 "白色情人节")
(holiday-fixed 4 1 "愚人节")
(holiday-fixed 5 1 "劳动节")
(holiday-float 5 0 2 "母亲节")
(holiday-fixed 6 1 "儿童节")
(holiday-float 6 0 3 "父亲节")
(holiday-fixed 7 1 "建党节")
(holiday-fixed 8 1 "建军节")
(holiday-fixed 9 10 "教师节")
(holiday-fixed 10 1 "国庆节")
(holiday-fixed 12 25 "圣诞节")))

(provide 'init-calendar)