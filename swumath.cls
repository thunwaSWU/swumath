%% ====================================================================
%% swumath.cls 
%% Last modified : 2020-12-04
%% Copyright (C) 2020- Thunwa Theerakarn
%
%
% The current maintainer of this work is Thunwa Theerakarn.
%
% This work consists of the files swumath.cls 
%
%% ====================================================================
%
% This file is a modification of 'chula.cls' by Wicharn Lewkeeratiyutkul and Mark E. Hall 
% and 'ucbthesis.cls' by Daniel Gildea, BBF, Ethan Munson, and Paul Vojta.

\NeedsTeXFormat{LaTeX2e}[2020/02/02]
\ProvidesClass{swumath}
[2020/12/23 v1.0 Srinakharinwirot University, Department of Mathematics, Thesis Class]

%    ****************************************
%    *               OPTIONS                *
%    ****************************************

\newif\ifproject

\newcommand\@subject{}
\DeclareOption{ma491}{%
\renewcommand\@subject{0}
\projectfalse}
\DeclareOption{ma493}{%
\renewcommand\@subject{1}
\projecttrue}
\DeclareOption{st472}{%
\renewcommand\@subject{2}
\projectfalse}
\DeclareOption{st474}{%
\renewcommand\@subject{3}
\projecttrue}
\ExecuteOptions{ma491}

\DeclareOption{10pt}{%
  \OptionNotUsed%
  \ClassWarningNoLine{swumath}{Font size 10pt not allowed; using 12pt}%
}
\DeclareOption{11pt}{%
  \OptionNotUsed%
  \ClassWarningNoLine{swumath}{Font size 11pt not allowed; using 12pt}%
}
\DeclareOption{letterpaper}{%
  \OptionNotUsed%
  \ClassWarningNoLine{swumath}{Letter size paper not allowed; using A4 size}%
}

% Other options are passed on to the report class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% The \ProcessOptions command causes the execution of every option command
% FOO which is declared and for which the user typed the FOO option in his
% \documentclass.  For every undeclared option BAR there will be a warning
% message. (BBF 10/31/94)
\ProcessOptions\relax

% Now load the report class
\LoadClass[a4paper,12pt]{report}[1994/06/01]

\RequirePackage[margin=1in]{geometry}

%Double Space
\linespread{1.6}
\setlength{\parindent}{0.5in}
\setlength{\parskip}{1em}

% Change the chapter head commands so that the chapter head is
% centered and the chapter number is printed in capital Roman
% numerals in the head. Also, reduce the vertical spacing in
% the chapter head and use a smaller font. For "starred" chapters,
% include an entry in the table of contents, and use even more
% economical spacing in the chapter head.

\renewcommand\@makechapterhead[1]{%
  \vspace*{10\p@}%
  {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \large\bfseries \@chapapp\space \thechapter
        \par\nobreak
    \fi
    \interlinepenalty\@M
    \large\bfseries #1\par\nobreak
    \vskip 20\p@
    \thispagestyle{myheadings}
  }}
  
\renewcommand\@makeschapterhead[1]{%
\vspace*{10\p@}%
  {\parindent \z@ \centering
    \normalfont
    \interlinepenalty\@M
    \large\bfseries  #1\par\nobreak
    \vskip 10\p@
    \thispagestyle{myheadings}
  }}
\renewcommand\@schapter[1]{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi
         \addcontentsline{toc}{chapter}{#1}}
         
% Make the word "chapter" appear in all caps.
\renewcommand{\chaptername}{CHAPTER}
\renewcommand{\appendixname}{APPENDIX}

% Use a smaller font for section headings
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\large\bfseries}}

% Use better-looking symbols for the empty set and set minus.
\renewcommand{\emptyset}{\ensuremath{\varnothing}}
\renewcommand{\setminus}{\smallsetminus}

%    ****************************************
%    *              PRELOAD PACKAGES    
%    ****************************************

\RequirePackage{graphicx}
\RequirePackage[figurewithin=chapter, tablewithin=chapter, justification=centering]{caption}

%%%%%%%%%%%%%%%%%%%%%%%
%enumitem style
%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{enumitem}
\setlist[enumerate,1]{itemsep = 1 pt, topsep=0pt, label = (\arabic*), ref=\arabic*}
\setlist[itemize]{itemsep = 1 pt, topsep=0pt}

% Force loading of the package `amsthm' at this point, so we can
% change the word "Proof" that starts a proof environment to be
% upright and boldface.
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsthm}

\renewcommand{\proofname}{\upshape\bfseries Proof}

%Remove the space before proof that comes after theorem
\renewenvironment{proof}[1][\proofname]{\par
  \vspace{-\topsep}% remove the space after the theorem
  \pushQED{\qed}%
  \normalfont
  \topsep0pt \partopsep0pt % no space before
  \trivlist
  \item[\hskip\labelsep
        \itshape
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
  \addvspace{6pt plus 6pt} % some space after
}

\RequirePackage{ifthen}

%\renewcommand{\footnotesize}{\normalsize}
%\renewcommand{\@makefntext}[1]{%
%  \parindent 1em%
%  \noindent
%  \footnotespacing
%  \hbox to 1.8em{\hss\@makefnmark}#1
%  \par\normalspacing
%}
%\renewcommand{\defaultscriptratio}{.75}
%\renewcommand{\defaultscriptscriptratio}{.6}
%\setlength\topmargin{0\p@}
%\setlength\headheight{12\p@}
%\setlength\headsep{25\p@}
%\setlength\textwidth\paperwidth
%\addtolength\textwidth{-2.52in}
%\setlength\textheight\paperheight
%\addtolength\textheight{-2.52in}
%\setlength\oddsidemargin{.51in}
%\setlength\evensidemargin{.51in}

\pagestyle{myheadings}
\markboth{}{}
\raggedbottom

% A special environment for the front part of the thesis, such
% as the abstract, table of contents, etc.

\newcommand\frontmatter{%
    \cleardoublepage
  %\@mainmatterfalse
  \pagenumbering{roman}}

\newcommand\mainmatter{%
    \cleardoublepage
 % \@mainmattertrue
  \pagenumbering{arabic}}

\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
 % \@mainmatterfalse
   }

%\newenvironment{frontmatter}{%
%  \pagenumbering{roman}\addtocounter{page}{1}%
%  \singlespacing
%  \maketitle
%  \makeapprovalpage
%  \addtocontents{toc}%
%    {\protect\contentsline{chapter}{Abstract in Thai}{\roman{page}}}%
%  \addtocounter{page}{1}%
%  \addtocontents{toc}%
%    {\protect\contentsline{chapter}{Abstract in English}{\roman{page}}}%
%  \addtocounter{page}{1}%
%}{%
%  \tableofcontents
%  \clearpage
%  \pagenumbering{arabic}%
%  \normalspacing}

\newcommand{\@titlesize}{\large}
\newcommand{\@subtitlesize}{\normalsize}
\newcommand{\@authorsize}{\normalsize} % No Pharaoh he.

\renewcommand{\bibname}{References}

% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the front matter.

% The academic year
\newcommand{\@academicyear}{20XX}
\newcommand{\academicyear}[1]{\renewcommand{\@academicyear}{#1}}

% Number of members (default = 3, max = 5)
\newcommand{\@numberofmembers}{3}
\newcommand{\numberofmembers}[1]{\renewcommand{\@numberofmembers}{#1}}

% Group Members
\newcommand{\@nameone}{Name1}
\newcommand{\@nametwo}{Name2}
\newcommand{\@namethree}{Name3}
\newcommand{\@namefour}{Name4}
\newcommand{\@namefive}{Name5}
\newcommand{\@lastnameone}{Lastname1}
\newcommand{\@lastnametwo}{Lastname2}
\newcommand{\@lastnamethree}{Lastname3}
\newcommand{\@lastnamefour}{Lastname4}
\newcommand{\@lastnamefive}{Lastname5}
\newcommand{\@idone}{SID1}
\newcommand{\@idtwo}{SID2}
\newcommand{\@idthree}{SID3}
\newcommand{\@idfour}{SID4}
\newcommand{\@idfive}{SID5}
\newcommand{\nameone}[1]{\renewcommand{\@nameone}{#1}}
\newcommand{\nametwo}[1]{\renewcommand{\@nametwo}{#1}}
\newcommand{\namethree}[1]{\renewcommand{\@namethree}{#1}}
\newcommand{\namefour}[1]{\renewcommand{\@namefour}{#1}}
\newcommand{\namefive}[1]{\renewcommand{\@namefive}{#1}}
\newcommand{\lastnameone}[1]{\renewcommand{\@lastnameone}{#1}}
\newcommand{\lastnametwo}[1]{\renewcommand{\@lastnametwo}{#1}}
\newcommand{\lastnamethree}[1]{\renewcommand{\@lastnamethree}{#1}}
\newcommand{\lastnamefour}[1]{\renewcommand{\@lastnamefour}{#1}}
\newcommand{\lastnamefive}[1]{\renewcommand{\@lastnamefive}{#1}}
\newcommand{\idone}[1]{\renewcommand{\@idone}{#1}}
\newcommand{\idtwo}[1]{\renewcommand{\@idtwo}{#1}}
\newcommand{\idthree}[1]{\renewcommand{\@idthree}{#1}}
\newcommand{\idfour}[1]{\renewcommand{\@idfour}{#1}}
\newcommand{\idfive}[1]{\renewcommand{\@idfive}{#1}}

% Advisor
\newcommand{\@advisor}{Prof.X}
\newcommand{\@coadvisor}{YYYY}
\newcommand{\advisor}[1]{\renewcommand{\@advisor}{#1}}
\newcommand{\coadvisor}[1]{\renewcommand{\@coadvisor}{#1}}

% Number of examiners (default = 3, max = 4)
\newcommand{\@numberofexaminers}{3}
\newcommand{\numberofexaminers}[1]{\renewcommand{\@numberofexaminers}{#1}}

% Committee
\newcommand{\@examone}{Examiner 1}
\newcommand{\@examtwo}{Examiner 2}
\newcommand{\@examthree}{Examiner 3}
\newcommand{\@examfour}{Examiner 4}
\newcommand{\examone}[1]{\renewcommand{\@examone}{#1}}
\newcommand{\examtwo}[1]{\renewcommand{\@examtwo}{#1}}
\newcommand{\examthree}[1]{\renewcommand{\@examthree}{#1}}
\newcommand{\examfour}[1]{\renewcommand{\@examfour}{#1}}

\newcommand{\@programchair}{Assistant Professor Pisuttawan Sripirom Sirininlakul, Ph.D.}
\newcommand{\programchair}[1]{\renewcommand{\@programchair}{#1}}

%%%%%%%%

\newcommand{\titlesize}[1]{\renewcommand{\@titlesize}{#1}}
\newcommand{\subtitlesize}[1]{\renewcommand{\@subtitlesize}{#1}}
\newcommand{\authorsize}[1]{\renewcommand{\@authorsize}{#1}}

%%%%%%%%%
%   AMSTHM
%%%%%%%%%
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}

\newtheorem{conjecture}[theorem]{Conjecture}
\newtheorem{assumption}[theorem]{Assumption}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{notation}[theorem]{Notation}
\newtheorem{claim}[theorem]{Claim}

\theoremstyle{definition}
\newtheorem{example}[theorem]{Example}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{observation}[theorem]{Observation}
\newtheorem{question}[theorem]{Question}

%    ****************************************
%    *               LOCALIZATION                *
%    ****************************************
\newcommand{\@by}{by}
\newcommand{\@bycaptital}{By}
\newcommand{\@studentidtext}{Student ID}
\newcommand{\@advisortext}{Advisor}
\newcommand{\@seminaradvisortext}{Seminar Advisor}
\newcommand{\@seminarcoadvisortext}{Seminar Co-Advisor}
\newcommand{\@coadvisortext}{Co-Advisor}
\newcommand{\@submittitle}{%
     A Report Submitted in Partial Fulfillment of the Requirements\\
     for the Bachelor's Degree of Science in 
    \ifnum\@subject<2%
    Mathematics\\
    \else
    Statistics\\
    \fi
     Department of Mathematics, Faculty of Science\\
     Srinakharinwirot University\\
      Academic Year  \@academicyear \\
}
\newcommand{\@swulogo}{Srinakharinwirot_Logo_EN_Color.png}
\newcommand{\@subjectname}{%
\ifnum\@subject=0%
    MA 491 MATHEMATICS SEMINAR
    \else\fi \ifnum\@subject=1%
    MA 493 MATHEMATICS PROJECT
    \else\fi \ifnum\@subject=2%
    ST 472 SEMINAR IN STATISTICS
    \else\fi  \ifnum\@subject=3%
    ST 474 STATISTICS PROJECT II
    \fi
}
\newcommand{\@phdtext}{, Ph.D.}
\newcommand{\@titletext}{Title}
\newcommand{\@seminartitletext}{Seminar Title}
\newcommand{\@presentedbytext}{Presented by}
\newcommand{\@researcharticletext}{Research Article}
\newcommand{\@acceptedbytext}{%
Accepted by the Department of Mathematics, Faculty of Science,
    Srinakharinwirot University in Partial Fulfillment of the Requirements
    for the Bachelor's Degree of Science in Mathematics.
}
\newcommand{\@chairpersontext}{Program Chairperson}
\newcommand{\@examinertext}{Examiner}
\newcommand{\@committeetext}{Committee}
\newcommand{\@abstracttext}{Abstract}
\newcommand{\@acknowledgementtext}{ACKNOWLEDGMENT}

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
 \@by
     \@authorsize

   \begin{tabular}{l@{\hspace{1em}}l@{\hspace{2em}}l}
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
     
     \vfill
    \begin{center}
    	\@advisortext\\
    	\vskip 1.0\p@	
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

\newcommand{\signatureline}{\leaders\hbox to 0.3em{\hss.\hss}\hskip 2.2in}
\newcommand{\Asignature}[2]{%
  \hbox{\indent\signatureline\ #1}\hbox{\indent(#2)}}

% APPROVAL PAGE

\newcommand{\makeapprovalpage}{%
\thispagestyle{empty}
\ifproject

  \noindent
     \begin{tabular}{@{}p{0.2\linewidth}@{\hspace{0.5em}}r@{\hspace{0.5em}}p{0.75\linewidth}}
     \@titletext&: &\@title\cr
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
     \@researcharticletext&:&Reserach ArticleReserach ArticleReserach ArticleReserach ArticleReserach ArticleReserach ArticleReserach ArticleReserach ArticleReserach \cr
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

%%%% Abstract Page %%%%%
\renewenvironment{abstract}
  {\chapter*{\@abstracttext}
  \ifproject
  \begin{center} \@title \\
  \@by\\
  \@nameone \hspace{0.2em} \@lastnameone
  \ifnum\@numberofmembers>1%
  \\ \@nametwo \hspace{0.2em} \@lastnametwo
  \fi
  \ifnum\@numberofmembers>2%
  \\ \@namethree \hspace{0.2em} \@lastnamethree
  \fi
 \ifnum\@numberofmembers>3%
  \\ \@namefour \hspace{0.2em} \@lastnamefour
  \fi   
  \end{center}
  \fi
  \thispagestyle{myheadings}
  }{%
  \clearpage}
%\else
%\renewenvironment{abstract}
%  {\chapter*{Abstract}
%  \thispagestyle{myheadings}
%  }{%
%  \clearpage}
%  \fi
  
  
\newenvironment{acknowledgment}{%
  \chapter*{\@acknowledgementtext}
  \thispagestyle{myheadings}
}{%
  \clearpage}

\renewcommand{\contentsname}{CONTENTS}
\renewcommand{\l@figure}{\@dottedtocline{1}{2em}{2.5em}}
\let\l@table\l@figure

\renewcommand\tableofcontents{%
  \clearpage
  \global\@topnum\z@
  \@makeschapterhead{\contentsname
    \@mkboth{\contentsname}{\contentsname}}%
  \@afterheading
  \singlespacing
  \@starttoc{toc}%
  \normalspacing
  \clearpage
  }

%\renewenvironment{thebibliography}[1]
%     {\chapter*{Bibliography
%        \@mkboth{\uppercase{\bibname}}{\uppercase{\bibname}}}%
%      \list{\@biblabel{\arabic{enumiv}}}%
%           {\settowidth\labelwidth{\@biblabel{#1}}%
%            \leftmargin\labelwidth
%            \advance\leftmargin\labelsep
%            \@openbib@code
%            \usecounter{enumiv}%
%            \let\p@enumiv\@empty
%            \renewcommand\theenumiv{\arabic{enumiv}}}%
%      \sloppy\clubpenalty4000\widowpenalty4000%
%      \sfcode`\.=\@m\relax
%%      \addcontentsline{toc}{chapter}{\bibname}
%      \singlespacing
%      }
%     {\def\@noitemerr
%       {\@latex@warning{Empty `thebibliography' environment}}%
%      \normalspacing
%      \endlist}

%\newcommand\makevita{%
%  \typeout{Vita}
%  \thispagestyle{plain}
%  \chapter*{Vita}
%  \singlespacing
%  \let\\=\cr
%  \halign{##\hfil&\quad##\hfil\cr
%    Name&\@author\cr
%    Degree&\@prevdegree\cr
%    &\@prevdegreeuniv\cr
%    &\@prevdegreecity\@othervita\cr}%
%  \clearpage}

%\newcommand{\tablelistpage}{%
%  \singlespacing
%  \label{lot}
%%  \prelim@contents{\listtablename}
%  \listoftables
%  \normalspacing
%  \clearpage
%}

%\newcommand{\figurelistpage}{%
%  \singlespacing
%  \label{lof}
%  \prelim@contents{\listfigurename}
%  \listoffigures
%  \normalspacing
%  \clearpage
%}
%\newcommand{\abbrlist}{%
%  \singlespacing
%  \prelim@contents{List of Abbreviations}
%  \chapter*{List of Abbreviations}
%}
%
%\newcommand{\symlist}{%
%  \singlespacing
%  \prelim@contents{List of Symbols}
%  \chapter*{List of Symbols}
%}

\newcommand{\halfspacing}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{0.5}\tiny\CS}
\newcommand{\singlespacing}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{1.0}\tiny\CS}
\newcommand{\singlespacingplus}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{1.25}\tiny\CS}
\newcommand{\doublespacing}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{1.75}\tiny\CS}
\newcommand{\realdoublespacing}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{2}\tiny\CS}
\newcommand{\normalspacing}{\doublespacing}
\newcommand{\footnotespacing}{\singlespacing}
\newcommand{\changespacing}[2]{%
  \renewcommand{#1}{%
    \let\CS=\@currsize\renewcommand{\baselinestretch}{#2}\tiny\CS}%
}
\newcommand{\changenormalspacing}[1]{\renewcommand{\normalspacing}{#1}}
\normalspacing

\endinput
%%
%% End of file `chula.cls'.
 
%\begin{center}
%	\halign{##\hfil&\hskip 0.5em ##\hfil&\hskip 2.0em ##\hfil\cr

%		\@nameone &\@lastnameone     &\@idone \cr
%		\@nametwo &\@lastnametwo     &\@idtwo
%		\ifthenelse{\equal{\@namethree}{xxxx}}{}{%
%			\cr\@namethree &\@lastnamethree &\@idthree}\cr}