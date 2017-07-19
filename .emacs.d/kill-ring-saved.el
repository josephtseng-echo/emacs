(setq kill-ring '(" \\%{$data}){" "if(is_null( $arg) || is_bool( $arg)){
				$str .= '';
			}elseif( is_string( $arg) || is_numeric( $arg)){
				$str .= 'T' . $mtkey . preg_replace('/[^0-9a-z]/i', '', $arg, -1);
			}else{
				ksort( $arg, SORT_STRING);
				foreach( $arg as $key => $value){
					$str .= ($key . '=' . $this->joins( $value, $mtkey, $api));
				}
			}" "    if(!is_object($param)){
        
    }
" "        print_r($flag);exit();
" "_dump" "var" "        print_r($param);
" "        echo \"yes\";exit();
" "color-theme-solarized" "clclass_name {
    public function __construct() {
        
    }
}
" "json_decode
" "(use-package helm-projectile
  :ensure t
  :commands helm-projectile-on)

(use-package projectile
  :ensure t
  :commands projectile-mode
  :bind-keymap (\"C-c p\" . projectile-command-map)
  :init
  (add-hook 'prog-mode-hook #'projectile-mode)
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm))" "class Acb {
    public function __construct() {

    }
}

$a = new Acb();" "class_parents(mixed $class,bool $autoload )" "(global-set-key (kbd \"C-c g\") 'goto-line)" "/**
 * Short description for a.php
 *
 * @package a
 * @author josephzeng <josephzeng36@gmail.com>
 * @version 0.1
 * @copyright (C) 2017 josephzeng <josephzeng36@gmail.com>
 * @license MIT
 */
class A{
    function abc(function_args)
    {

    }
}

$a = new A();
$a->abc();

class abc {
    public function __construct() {

    }
}" "周五，付力老师带你走进HTTP协议的前身今世。
http://u.oa.com/train/course.php?id=1090" "
function method($a){
    return $a;
}
$a = 0;
method($a);
method(&$a);
echo $a;
class A {
      function
}" "(use-package python
  :mode (\"\\\\.py'\" . python-mode)
  :init
  (progn
    (defalias 'python2-mode 'python-mode)
    (defalias 'python3-mode 'python-mode)))"))
