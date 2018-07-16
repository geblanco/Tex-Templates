#!/bin/bash

doc_class=$1; shift
title=$1; shift
author=$1; shift

tpl1='\usepackage{hyperref}

%\setbeameroption{show only notes}
\usetheme{material}

\date{\today}
'

tpl2='\begin{document}
\maketitle
\end{document}'

doc_class_str="\documentclass{beamer}"
title_str="\title{\textbf{${title}}}"
author_str="\author{${author}}"

printf '%s\n\n%s\n\n%s\n%s\n\n%s\n' "$doc_class_str" "$tpl1" "$title_str" "$author_str" "$tpl2" 
