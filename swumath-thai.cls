%% ====================================================================
%% swumath_thai.cls 
%% Last modified : 2021-06-22
%% Copyright (C) 2020- Thunwa Theerakarn
%% Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
%% and associated documentation files (the "Software"),to deal in the Software without restriction, 
%% including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
%% and/or sell copies of the Software, and to permit persons to whom the Software is furnished to 
%% do so, subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
%%
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
%% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
%% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
%% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
%% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
%% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
%% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%%
%%
%% The current maintainer of this work is Thunwa Theerakarn.
%%
%% This work consists of the files swumath_thai.cls 
%%
%% ====================================================================
%
% This file is a modification of 'chula.cls' by Wicharn Lewkeeratiyutkul and Mark E. Hall 
% and 'ucbthesis.cls' by Daniel Gildea, BBF, Ethan Munson, and Paul Vojta.

\NeedsTeXFormat{LaTeX2e}[2020/02/02]
\ProvidesClass{swumath-thai}
[2021/06/22 v1.03 Srinakharinwirot University, Department of Mathematics, Thesis Class]

% All options are passed on to swumath
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{swumath}}

% The \ProcessOptions command causes the execution of every option command
% FOO which is declared and for which the user typed the FOO option in his
% \documentclass.  For every undeclared option BAR there will be a warning
% message. (BBF 10/31/94)
\ProcessOptions\relax

% Now load the report class
\LoadClass[a4paper,12pt]{swumath}[2020/12/23]

%    ****************************************
%    *               LOCALIZATION                *
%    ****************************************

\newcommand{\@engtitle}{Title in English}
\newcommand{\engtitle}[1]{\renewcommand{\@engtitle}{#1}}

\setlength{\parskip}{0.6em}

\renewcommand{\@programchair}{ผู้ช่วยศาสตราจารย์ ดร.พิศุทธวรรณ ศรีภิรมย์ สิรินิลกุล}
\renewcommand{\@by}{จัดทำโดย}
\renewcommand{\@bycaptital}{จัดทำโดย}
\renewcommand{\@studentidtext}{รหัสนิสิต}
\renewcommand{\@advisortext}{อาจารย์ที่ปรึกษา}
\renewcommand{\@seminaradvisortext}{อาจารย์ที่ปรึกษา}
\renewcommand{\@coadvisortext}{อาจารย์ที่ปรึกษาร่วม}
\renewcommand{\@seminarcoadvisortext}{อาจารย์ที่ปรึกษาร่วม}
\renewcommand{\@submittitle}{%
	รายงานนี้เป็นส่วนหนึ่งของการศึกษาตามหลักสูตรปริญญาวิทยาศาสตร์บัณฑิต\\
	    \ifnum\@subject<2%
    สาขาวิชาคณิตศาสตร์ 
    \else
    สาขาวิชาสถิติ 
    \fi
     ภาควิชาคณิตศาสตร์\\
     คณะวิทยาศาสตร์ มหาวิทยาลัยศรีนครินทรวิโรฒ\\
    ปีการศึกษา \@academicyear
}
\renewcommand{\@swulogo}{Srinakharinwirot_Logo_TH_Color.png}
\renewcommand{\@subjectname}{%
\ifnum\@subject=0%
    คณ 491 สัมมนาคณิตศาสตร์
    \else\fi \ifnum\@subject=1%
    คณ 493 โครงงานคณิตศาสตร์
    \else\fi \ifnum\@subject=2%
    สถ 472 สัมมนาทางด้านสถิติ 
    \else\fi  \ifnum\@subject=3%
    สถ 474 โครงงานสถิติ 2
    \fi
}
\renewcommand{\@phdtext}{}
\renewcommand{\@titletext}{ชื่อหัวข้อ}
\renewcommand{\@seminartitletext}{ชื่อหัวข้อสัมมนา}
\renewcommand{\@presentedbytext}{นำเสนอโดย}
\renewcommand{\@researcharticletext}{บทความวิจัย}
\renewcommand{\@acceptedbytext}{%
ภาควิชาคณิตศาสตร์ คณะวิทยาศาสตร์ มหาวิทยาลัยศรีนครินทรวิโรฒ อนุมัติให้นับรายงานนี้เป็นส่วนหนึ่งของการศึกษาระดับปริญญาตรีในรายวิชา \@subjectname}
\renewcommand{\@chairpersontext}{ประธานหลักสูตร}
\renewcommand{\@examinertext}{กรรมการ}
\renewcommand{\@committeetext}{คณะกรรมการ}
\renewcommand{\@abstracttext}{บทคัดย่อ}
\renewcommand{\@acknowledgementtext}{กิตติกรรมประกาศ}

%%%%%%%%%
%   AMSTHM
%%%%%%%%%
\def\renewtheorem#1{%
  \expandafter\let\csname#1\endcsname\relax
  \expandafter\let\csname c@#1\endcsname\relax
  \gdef\renewtheorem@envname{#1}
  \renewtheorem@secpar
}
\def\renewtheorem@secpar{\@ifnextchar[{\renewtheorem@numberedlike}{\renewtheorem@nonumberedlike}}
\def\renewtheorem@numberedlike[#1]#2{\newtheorem{\renewtheorem@envname}[#1]{#2}}
\def\renewtheorem@nonumberedlike#1{  
\def\renewtheorem@caption{#1}
\edef\renewtheorem@nowithin{\noexpand\newtheorem{\renewtheorem@envname}{\renewtheorem@caption}}
\renewtheorem@thirdpar
}
\def\renewtheorem@thirdpar{\@ifnextchar[{\renewtheorem@within}{\renewtheorem@nowithin}}
\def\renewtheorem@within[#1]{\renewtheorem@nowithin[#1]}

%\theoremstyle{plain}
\renewtheorem{theorem}{ทฤษฎีบท}[section]
\renewtheorem{lemma}[theorem]{บทตั้ง}
\renewtheorem{corollary}[theorem]{บทแทรก}

\renewtheorem{conjecture}[theorem]{ข้อคาดการณ์}
\renewtheorem{assumption}[theorem]{ข้อสมมติ}
\renewtheorem{proposition}[theorem]{ทฤษฎีบท}
\renewtheorem{notation}[theorem]{สัญกรณ์}
\renewtheorem{claim}[theorem]{คำอ้าง}

%\theoremstyle{definition}
\renewtheorem{example}[theorem]{ตัวอย่าง}
\renewtheorem{definition}[theorem]{นิยาม}
\renewtheorem{remark}[theorem]{ข้อสังเกต}
\renewtheorem{observation}[theorem]{ข้อสังเกต}
\renewtheorem{question}[theorem]{คำถาม}

%% Title Page
% TITLE PAGE
\renewcommand{\maketitle}{%
\begin{titlepage}
       	\centering
   \includegraphics[width=4cm]{\@swulogo}
 
 %ST474 Statistics Project II
%ST472 Seminar In Statistics
 
  \begin{center}
    \@titlesize \@subjectname
  	\end{center}
   \vfill
    \begin{center}%
      \@titlesize \@title %\expandafter\uppercase\expandafter{\@title}
    \end{center}
    \vfill
 \@by\\
 \vspace{0.5em}
     \@authorsize
\renewcommand{\arraystretch}{1.5}
   \begin{tabular}{l@{\hspace{0.5em}}l@{\hspace{1.5em}}l}
   \@nameone &\@lastnameone &\@studentidtext: \@idone \\%
 	\ifnum\@numberofmembers>1%
	\@nametwo &\@lastnametwo &\@studentidtext: \@idtwo \\%
   	\fi
	\ifnum\@numberofmembers>2%
	\@namethree &\@lastnamethree &\@studentidtext: \@idthree \\%
   	\fi
	\ifnum\@numberofmembers>3%
	\@namefour &\@lastnamefour &\@studentidtext: \@idfour \\%
   	\fi
	\ifnum\@numberofmembers>4%
	\@namefive &\@lastnamefive &\@studentidtext: \@idfive \\%
   	\fi
   \end{tabular}
\renewcommand{\arraystretch}{1} 
     
     \vfill
    \begin{center}
    	\@advisortext\\
    	\vspace{0.5em}
    	\@authorsize
    	\@advisor
\ifthenelse{\equal{\@coadvisor}{YYYY}}{}{%
    \vskip 1.0\p@
    \@coadvisortext \\
    \vskip 1.0\p@
    \@authorsize
    \@coadvisor
    }
    \end{center}
    \vfill
    \begin{center}
      \@subtitlesize \@submittitle
    \end{center}
  \end{titlepage}
}

\renewenvironment{titlepage}{%
  \typeout{Title page}
  \thispagestyle{empty}
}{%
  \clearpage
}

%\renewcommand{\contentsname}{สารบัญ}
%\renewcommand{\listtablename}{สารบัญตาราง}
%\renewcommand{\listfigurename}{สารบัญภาพ}

%\renewcommand\tableofcontents{%
%  \clearpage
%  \global\@topnum\z@
%  \@makeschapterhead{\contentsname
%    \@mkboth{\contentsname}{\contentsname}}%
%  \@afterheading
%  \singlespacing
%  \@starttoc{toc}%
%  \normalspacing
%  \clearpage
%  }

% APPROVAL PAGE
\renewcommand{\makeapprovalpage}{%
\thispagestyle{empty}
\ifproject

  \noindent
     \begin{tabular}{@{}p{0.2\linewidth}@{\hspace{0.5em}}r@{\hspace{0.5em}}p{0.75\linewidth}}
     \@titletext&: &\@title\cr
     &&\@engtitle\cr
     \@bycaptital&: &\@nameone\hskip 0.3em \@lastnameone\cr
     \ifnum\@numberofmembers>1%
    &&\@nametwo\hskip 0.3em \@lastnametwo\cr 
    \else\fi
     \ifnum\@numberofmembers>2%
    &&\@namethree\hskip 0.3em \@lastnamethree\cr 
    \else\fi
    \ifnum\@numberofmembers>3%
    &&\@namefour\hskip 0.3em \@lastnamefour\cr 
    \else\fi
    \ifnum\@numberofmembers>4%
    &&\@namefive\hskip 0.3em \@lastnamefive\cr 
    \else\fi
    \@advisortext&: &\@advisor\@phdtext
    \ifthenelse{\equal{\@coadvisor}{YYYY}}{}{%
	\cr\@coadvisortext&: &\@coadvisor\@phdtext}
   \end{tabular}
\else
  \noindent
     \begin{tabular}{@{}p{0.25\linewidth}@{\hspace{0.5em}}r@{\hspace{0.5em}}p{0.7\linewidth}}
     \@seminartitletext&: &\@title\cr
     \@researcharticletext&:&\@researcharticle\cr
     \@presentedbytext&: &\@nameone\hskip 0.3em \@lastnameone\cr
     \ifnum\@numberofmembers>1%
    &&\@nametwo\hskip 0.3em \@lastnametwo\cr 
    \fi
     \ifnum\@numberofmembers>2%
    &&\@namethree\hskip 0.3em \@lastnamethree\cr 
    \fi
    \ifnum\@numberofmembers>3%
    &&\@namefour\hskip 0.3em \@lastnamefour\cr 
    \fi
    \ifnum\@numberofmembers>4%
    &&\@namefive\hskip 0.3em \@lastnamefive\cr 
    \fi
   \end{tabular}
\fi
  \vskip 10\p@
  \hrule
  \vskip 6\p@
%  \vskip 1.5\baselineskip
%  \singlespacing
  \indent \@acceptedbytext
  \vfill
  \Asignature{\@chairpersontext}{\@programchair}
  \vfill
  \hbox{\@committeetext}
  \vfill
  \ifproject
  \Asignature{\@advisortext}{\@advisor\@phdtext}
  \else
  \Asignature{\@seminaradvisortext}{\@advisor\@phdtext}
  \fi
  \ifthenelse{\equal{\@coadvisor}{YYYY}}{}{%
    \vfill
    \ifproject
    \Asignature{\@coadvisortext}{\@coadvisor\@phdtext}
    \else
    \Asignature{\@seminarcoadvisortext}{\@coadvisor\@phdtext}
    \fi}
\vfill
  \Asignature{\@examinertext}{\@examone}
  \ifnum\@numberofexaminers>1%
  \vfill
  \Asignature{\@examinertext}{\@examtwo}
  \fi
    \ifnum\@numberofexaminers>2%
  \vfill
  \Asignature{\@examinertext}{\@examthree}
  \fi
      \ifnum\@numberofexaminers>3%
  \vfill
  \Asignature{\@examinertext}{\@examfour}
  \fi
  \vfill
  \clearpage
}

