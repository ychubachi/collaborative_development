(setq make-backup-files nil)
(setq auto-save-default nil)

(require 'ox-latex)

;;; LaTeX Settings
(setq
 org-latex-pdf-process
 `(,(concat
     "latexmk -e '$pdflatex=q/xelatex -shell-escape %S/' "
     "-e '$bibtex=q/upbibtex %B/' "
     "-e '$biber=q/biber --bblencoding=utf8 -u -U --output_safechars %B/' "
     "-e '$makeindex=q/upmendex -o %D %S/' "
     "-norc -gg -pdf %f")))

;; Times を TeX 用に配置し直した TX フォント
(add-to-list 'org-latex-packages-alist '("" "txfonts") t)

;; ソースコードの整形にmintedを利用
(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted") t)
(setq org-latex-minted-options
      '(("frame" "single") ("linenos" "true") ("numbersep" "3pt")
	("fontfamily" "courier") ("breaklines" "true")))

(setq org-latex-default-class "bxjsarticle")

(add-to-list 'org-latex-classes
             '("bxjsarticle"
               "\\documentclass[xelatex,ja=standard,jbase=11Q,a4paper]{bxjsarticle}
[DEFAULT-PACKAGES]
\\hypersetup{colorlinks=true}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;;; Beamer Settings

;; Outlineのタイトルを目次にします
(setq org-beamer-outline-frame-title "目次")

;; Beamer用クラスの設定（3階層用）
(add-to-list 'org-latex-classes
	     '("beamer"
	       "\\documentclass[xelatex,14pt,presentation,t]{beamer}
\\XeTeXgenerateactualtext=1
\\usepackage{zxjatype}
\\setjamainfont{IPAexMincho}
\\setjasansfont{IPAexGothic}
\\setjamonofont{IPAexGothic}
[DEFAULT-PACKAGES]
\\hypersetup{colorlinks=true}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

  ;; Beamer用クラスの設定（4階層用）
  (add-to-list 'org-latex-classes
               '("beamer-part"
                 "\\documentclass[xelatex,14pt,presentation,t]{beamer}
\\XeTeXgenerateactualtext=1
\\usepackage{zxjatype}
\\setjamainfont{IPAexMincho}
\\setjasansfont{IPAexGothic}
\\setjamonofont{IPAexGothic}
[DEFAULT-PACKAGES]
\\hypersetup{colorlinks=true}"
                 ("\\part{%s}" . "\\part*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
