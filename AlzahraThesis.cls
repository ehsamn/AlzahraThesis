%%  LaTex class file for writing MSc thesis and PhD dissertation for 
%%  Department of Mathematics, Alzahra University
%%  Version 1.01
%%
%%   By 
%%   Sayyed Ehsan Monabbati and Farid Behrouzi
%%   
%%   1397 11 10
%% 
%%  We list some other known contributors here:
%%  (1) Sayyed Mahdi Mousavi

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AlzahraThesis}
              [08/03/2021 v1.00
Document class for MSc thesis and PhD dissertation for Department of Mathematics, Alzahra University]

\LoadClass[a4paper,10pt]{book}
\RequirePackage{xargs}
\RequirePackage{titlesec}
\RequirePackage{xspace}


\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage{framed}
\RequirePackage{graphicx}
\RequirePackage{setspace}

\RequirePackage[top=0.98in, bottom=0.98in, left=0.98in, right=1.38in,headheight=10mm,height=25cm]{geometry}
\RequirePackage{amsthm,amssymb,amsmath}

\RequirePackage{makeidx}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{multicol}
\RequirePackage[xindy]{glossaries}
\RequirePackage{caption}
\captionsetup[table]{labelsep=space} 
\captionsetup[figure]{labelsep=space}

\RequirePackage[extrafootnotefeatures]{xepersian}
\settextfont[Scale=1.1]{XB Zar}
\setdigitfont[Scale=1]{XB Yas}

\defpersianfont\chapternumber[Scale=3]{XB Zar}
\defpersianfont\chapterfont[Scale=2]{XB Zar}
\defpersianfont\sectionfont[Scale=1.1]{XB Zar}
\defpersianfont\subsectionfont[Scale=1]{XB Zar}
\renewcommand\proofname{\textbf{برهان}} 
% دستوری برای تغییر نام کلمه «کتاب‌نامه» به «مراجع»
\renewcommand{\bibname}{فهرست منابع و مآخذ}



\newglossarystyle{mylistFa}{
\glossarystyle{list}\phantomsection
\addcontentsline{toc}{chapter}{واژه‌نامه فارسی به انگلیسی}
\renewenvironment{theglossary}{}{}
\renewcommand*{\glossaryheader}{}
\renewcommand*{\glsgroupheading}[1]{\hspace{1mm}\\}
\renewcommand*{\glsgroupskip}{}
\renewcommand*{\glossaryentryfield}[5]     {\noindent\glstarget{##1}{##2}\hfill \space ##3 \\}
\renewcommand*{\glossarysubentryfield}[6]{\glossaryentryfield{##2}{##3}{##4}{##5}{##6}}
}



\newglossarystyle{notation}{
\glossarystyle{list}\phantomsection
\addcontentsline{toc}{chapter}{واژه‌نامه انگلیسی به فارسی}
\renewenvironment{theglossary}{}{}
\renewcommand*{\glossaryheader}{}
\renewcommand*{\glsgroupheading}[1]{\hspace{1mm}\\}
\renewcommand*{\glsgroupskip}{}
\renewcommand*{\glossaryentryfield}[5]     {
\noindent\glstarget{##1}{##3}\hfill \space ##2 \\
}
\renewcommand*{\glossarysubentryfield}[6]{\glossaryentryfield{##2}{##3}{##4}{##5}{##6}}
%\renewcommand{\glossarymark}[1]{\markright{#1}} 
}

\def\appendixMode{
\appendix
\addcontentsline{toc}{chapter}{پیوست}
}

 \def\notation#1#2{\parbox[t]{12mm}{#1}\parbox[t]{5.2cm}{#2}\\}

\def\IncludeNotationPage#1{
\pagestyle{empty}
\chapter*{فهرست نمادها و کوتاه‌نویس‌ها}
\phantomsection
\addcontentsline{toc}{chapter}{فهرست نمادها و کوتاه‌نویس‌ها}
#1
}

\def\IncludePrefacePage#1{
\chapter*{پیشگفتار}
\phantomsection
\addcontentsline{toc}{chapter}{پیشگفتار}
#1
}



\def\includeIndex{
\renewcommand\glossaryname{نمایه} 
\glossarystyle{list}
\pagestyle{plain}
\phantomsection‮
\addcontentsline{toc}{chapter}{نمایه}

\printglossary
\newpage
}

\def\includeEntoFaDictionary{
\glossarystyle{mylistEn} 
\printglossary[type=english]
\newpage

}


\def\includeFatoEnDictionary{

\glossarystyle{mylistFa}
\printglossary[type=persian]
}

\newglossarystyle{mylistEn}{
\glossarystyle{list}\phantomsection
\addcontentsline{toc}{chapter}{واژه‌نامه انگلیسی به فارسی}
\renewenvironment{theglossary}{}{}
\renewcommand*{\glossaryheader}{}
\renewcommand*{\glsgroupheading}[1]{\hspace{1mm}\\}
\renewcommand*{\glsgroupskip}{}
\renewcommand*{\glossaryentryfield}[5]     {\noindent\glstarget{##1}{##3}\hfill \space ##2 \\}
\renewcommand*{\glossarysubentryfield}[6]{\glossaryentryfield{##2}{##3}{##4}{##5}{##6}}
%\renewcommand{\glossarymark}[1]{\markright{#1}} 
}

% تعریف دو نمونه واژه نامه
%\newglossary[glg]{english}{gls}{glo}{واژه‌نامه انگلیسی به فارسی}
%\newglossary[blg]{persian}{bls}{blo}{واژه‌نامه فارسی به انگلیسی}
%\newglossary[bblg]{persian1}{bbls}{bblo}{نمایه}

\newglossary[edic]{english}{edics}{edico}{واژه‌نامه انگلیسی به فارسی}
\newglossary[fdic]{persian}{fdics}{fdico}{واژه‌نامه فارسی به انگلیسی}
\newglossary[ind]{index}{inds}{indo}{نمایه}



% توسط این دستور واژه مورد نظر در متن، هر دو واژه نامه و پاورقی می آید.
\newcommand{\inpdic}[2]{
	\newglossaryentry{fa-pdic-#1}{type=persian,name={#1}, sort={#1},description={\lr{#2}}}\gls{fa-pdic-#1}\LTRfootnote{#2}
	\newglossaryentry{en-pdic-#1}{type=english,name={\lr{#2}}, sort={#2},description={#1}}\glsuseri{en-pdic-#1}\!\!%
}

% توسط این دستور واژه مورد نظر در متن، هر دو واژه نامه  می آید.
\newcommand{\indic}[2]{
	\newglossaryentry{fa-dic-#1}{type=persian,name={#1}, sort={#1},description={\lr{#2}}}\glsuseri{fa-dic-#1}
	\newglossaryentry{en-dic-#1}{type=english,name={\lr{#2}}, sort={#2},description={#1}}\glsuseri{en-dic-#1}
}

% توسط این دستور واژه مورد نظر فقط در هر دو واژه نامه  می آید.
\newcommand{\inind}[2]{
	\newglossaryentry{fa-#1}{type=persian,name={#1}, sort={#1},description={\lr{#2}}}\glsuseri{fa-#1}
	\newglossaryentry{en-#1}{type=english,name={\lr{#2}}, sort={#2},description={#1}}\glsuseri{en-#1}
}

\makeglossaries
\glsdisablehyper

\renewcommand{\glossarysection}[2][]{{\noindent \huge\bfseries #1} \\}


\newtheorem{theorem}{قضیه}[section]
\newtheorem{lemma}[theorem]{لم}
\newtheorem{proposition}[theorem]{گزاره}
\newtheorem{corollary}[theorem]{نتیجه}
\newtheorem{remark}[theorem]{ملاحظه}



\theoremstyle{definition}
\newtheorem{definition}[theorem]{تعریف}
\newtheorem{example}[theorem]{مثال}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% دستورهایی برای سفارشی کردن سربرگ صفحات



\def\university#1{\gdef\@university{#1}}
\def\department#1{\gdef\@department{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\thesisdate#1{\gdef\@thesisdate{#1}}
\newcommand{\firstsupervisor}[1]{\def\@firstsupervisor{#1}}
\newcommand{\secondsupervisor}[1]{\def\@secondsupervisor{#1}}
\newcommand{\firstadvisor}[1]{\def\@firstadvisor{#1}}
\newcommand{\secondadvisor}[1]{\def\@secondadvisor{#1}}

\newcommand{\acknowledgment}[1]{\def\@acknowledgment{#1}}
\newcommand{\dedication}[1]{\def\@dedication{#1}}
\def\@originalitydeclaration{}

\def\name#1{\gdef\@name{#1}}
\def\surname#1{\gdef\@surname{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
\def\faAbstract#1{\gdef\@faAbstract{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\subject#1{\gdef\@subject{#1}}
\def\field#1{\gdef\@field{#1}}
\def\supportedby#1{\gdef\@supportedby{#1}}
\def\firstsupervisoraffiliation#1{\gdef\@firstsupervisoraffiliation{#1}}
\def\secondsupervisoraffiliation#1{\gdef\@secondsupervisoraffiliation{#1}}
\def\firstadvisoraffiliation#1{\gdef\@firstadvisoraffiliation{#1}}
\def\secondadvisoraffiliation#1{\gdef\@secondadvisoraffiliation{#1}}
\def\defencemark#1{\gdef\@defencemark{#1}}
\def\shortbio#1{\gdef\@shortbio{#1}}

%\font\zarXIB = "XB Zar Bold" at 11pt
%\defpersianfont\zarXIB = "XB Zar Bold" at 11pt
\def\zarXIB{\bfseries\fontsize{11}{12}\selectfont}
%\font\zarXI = "XB Zar" at 11pt
\def\zarXI{\fontsize{11}{12}\selectfont}
\def\zarX{\fontsize{10}{11}\selectfont}
\def\zarXB{\bfseries\fontsize{10}{11}\selectfont}


%\font\zarXIIB = "XB Zar Bold" at 12pt
\def\zarXIIB{\bfseries\fontsize{12}{13}\selectfont}
%\font\zarXII = "XB Zar" at 12pt
\def\zarXII{\fontsize{12}{13}\selectfont}
%\font\zarXIIIB = "XB Zar Bold" at 13pt
\def\zarXIIIB{\bfseries\fontsize{13}{14}\selectfont}
%\font\zarXIVB = "XB Zar Bold" at 14 pt
\def\zarXIVB{\bfseries\fontsize{14}{15}\selectfont}



%\font\zarXVIB = "XB Zar Bold" at 16 pt
\def\zarXVIB{\bfseries\fontsize{16}{17}\selectfont}
%\font\zarXIV = "XB Zar" at 14 pt
\def\zarXIV{\fontsize{14}{15}\selectfont}

%\font\zarXVIIIB = "XB Zar Bold" at 18 pt
\def\zarXVIIIB{\bfseries\fontsize{18}{19}\selectfont}

\font\timesXIIB = "Times New Roman Bold" at 12 pt

\font\timesXII = "Times New Roman" at 12 pt


\font\timesXIVB = "Times New Roman Bold" at 14 pt
\font\timesXIV = "Times New Roman" at 14 pt

\font\timesXIIIB = "Times New Roman Bold" at 13 pt
\font\timesXIII = "Times New Roman" at 13 pt

\font\timesXVIB = "Times New Roman Bold" at 16 pt
\font\timesXVI = "Times New Roman" at 16 pt


\font\timesXVIIIB = "Times New Roman Bold" at 18 pt
\font\timesXVIII = "Times New Roman" at 18 pt

\font\timesXXB = "Times New Roman Bold" at 20 pt
\font\timesXX = "Times New Roman" at 20 pt


\font\timesX = "Times New Roman" at 10 pt
\font\timesXB = "Times New Roman Bold" at 10 pt


\font\timesXI = "Times New Roman" at 11 pt
\font\timesXIB = "Times New Roman Bold" at 11 pt


\font\nazXIVB = "IRNazanin Bold" at 14 pt


%\def\mainrefs#1{\gdef\@mainrefs{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\entitle#1{\gdef\@entitle{#1}}
\def\ensurname#1{\gdef\@ensurname{#1}}
\def\endegree#1{\gdef\@endegree{#1}}
\def\endepartment#1{\gdef\@endepartment{#1}}
\def\enfaculty#1{\gdef\@enfaculty{#1}}
\def\enthesisdate#1{\gdef\@enthesisdate{#1}}
\def\ensubject#1{\gdef\@ensubject{#1}}
\def\enfield#1{\gdef\@enfield{#1}}
\def\enfirstsupervisor#1{\gdef\@enfirstsupervisor{#1}}
\def\ensecondsupervisor#1{\gdef\@ensecondsupervisor{#1}}
\def\enfirstadvisor#1{\gdef\@enfirstadvisor{#1}}
\def\ensecondadvisor#1{\gdef\@ensecondadvisor{#1}}
\def\enname#1{\gdef\@enname{#1}}
\def\ensurname#1{\gdef\@ensurname{#1}}
\def\enAbstract#1{\gdef\@enAbstract{#1}}
\def\enkeywords#1{\gdef\@enkeywords{#1}}
\def\enuniversity#1{\gdef\@enuniversity{#1}}

\def\enfirstsupervisoraffiliation#1{\gdef\@enfirstsupervisoraffiliation{#1}}
\def\ensecondsupervisoraffiliation#1{\gdef\@ensecondsupervisoraffiliation{#1}}
\def\enfirstadvisoraffiliation#1{\gdef\@enfirstadvisoraffiliation{#1}}
\def\ensecondadvisoraffiliation#1{\gdef\@ensecondadvisoraffiliation{#1}}
\def\enshortbio#1{\gdef\@enshortbio{#1}}

\newcommand{\warningText}[1]{{( #1 )}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@bscthesis
\@bscthesisfalse
\DeclareOption{bsc}{\@bscthesistrue}
\newif\if@mscthesis
\@mscthesisfalse
\DeclareOption{msc}{\@mscthesistrue}
\newif\if@draftmode
\@draftmodefalse
\DeclareOption{draftmode}{\@draftmodetrue}




\ProcessOptions
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\AtBeginDocument{


\if@draftmode

\DraftModeTitle
\abstractPage
\else
\vtitle


\fi
\DeclareMathSizes{12}{11.9}{8.9}{6.9}

}

%% -----------------------------------------------------------------------------------------------------------		Specification labels
% This command has three parameters: 
% #1 : style of label
% #2 : something after label
% #3 : style of names
\newcommandx{\advisorLabel}[3][1={},2={},3={}]{%
%
{\ifx\@firstadvisor\undefined%
\ifx\@secondadvisor\undefined%
\else\fi
\else
\ifx\@secondadvisor\undefined%
\par\noindent
{#1 استاد مشاور #3}
{#2 
\@firstadvisor}
\else~\\
{#1  استادان مشاور }
{#2 \@firstadvisor{} #3 \@secondadvisor}
\fi\fi}\leavevmode
}

\newcommandx{\supervisorLabel}[3][1={}, 2={},3={}]{%
\ifx\@firstsupervisor\undefined%
\ifx\@secondsupervisor\undefined%
\else\fi
\else
\ifx\@secondsupervisor\undefined%
{ #1  استاد راهنما #3}
{#2
\@firstsupervisor}
\else
{#1 استادان راهنما }
{#2 \@firstsupervisor{} #3 \@secondsupervisor}
\fi\fi\leavevmode}


\newcommand{\gradeLabel}{
\if@mscthesis
کارشناسی ارشد
\else
\if@bscthesis
کارشناسی
\else
دکتری
\fi\fi
}

\newcommand{\reportLabel}{
\if@mscthesis
پایان‌نامه
\else
\if@bscthesis
گزارش
\else
رساله
\fi\fi
}
%---------------------------------------------------------------------------------------------------------- End specification labels




%% -----------------------------------------------------------------------------------------------------------		English Specification labels
\newcommandx{\enadvisorLabel}[3][1={},2={},3={}]{%
%
{\ifx\@enfirstadvisor\undefined%
\ifx\@ensecondadvisor\undefined%
\else\fi
\else
\ifx\@ensecondadvisor\undefined%
\par\noindent
{#1 Advisor#3}
{#2 
\@enfirstadvisor#3}
\else~\\
{#1  Advisors}
{#2 \@enfirstadvisor{} #3 \@ensecondadvisor}
\fi\fi}
}

\newcommandx{\ensupervisorLabel}[3][1={}, 2={},3={}]{%
\ifx\@enfirstsupervisor\undefined%
\ifx\@ensecondsupervisor\undefined%
\else\fi
\else
\ifx\@ensecondsupervisor\undefined%
{ #1  Supervisor #3}
{#2
\@enfirstsupervisor #3}
\else
{#1 Supervisors }
{#2 \@enfirstsupervisor{} #3 \@ensecondsupervisor}
\fi\fi}


\newcommand{\engradeLabel}{
\if@mscthesis
 Master of Science
\else
\if@bscthesis
Bachelor of Science
\else
Doctor of Philosophy
\fi\fi
}

\newcommand{\enreportLabel}{
\if@mscthesis
Thesis
\else
\if@bscthesis
Report
\else
Dissertation
\fi\fi
}
%---------------------------------------------------------------------------------------------------------- End English specification labels

% -------------------------------------------------------------------------------------------------------- persian vtitle 
\newcommand{\vtitle}{

\ifthenelse{\isundefined{\@faculty}}
{
	\faculty{\warningText{دانشکده را تعیین کنید}}
}
{

}


\ifthenelse{\isundefined{\@title}}
{
	\title{\warningText{عنوان را تعیین کنید}}
}
{
  
}

\ifthenelse{\isundefined{\@department}}
{
	\department{ \warningText{دانشکده را تعیین کنید} }
}
{

}

\ifthenelse{\isundefined{\@field}}
{
	\field{\warningText{گرایش را تعیین کنید} }
}
{

}

\onCoverTitle

\newpage
\pagestyle{empty}
\baselineskip=.7cm
\enthesisSpecificationTable
\thesisSpecificationTable




\newpage\clearpage
%\newpage\thispagestyle{empty}

\centerline{{\includegraphics[height=6cm]{pics/besm}}}


\inVolumeTitle


\ifthenelse{\isundefined{\@originalitydeclaration}} 
{
}
{
 \newpage
	\newpage
	\makeatletter
	\include{originalitydeclaration}
	\makeatother

}





\ifthenelse{\isundefined{\@dedication}} 
{
}
{
 \newpage
 \@dedication
}
!

\ifthenelse{\isundefined{\@acknowledgment}} 
{
}
{
 \newpage
 \@acknowledgment
}


\newpage

\abstractPage



}

% -------------------------------------------------------------------------------------------------------- End persian vtitle 

\newcommand{\abstractPage}{

{\noindent\zarXIVB  چکیده}\\
\zarXII
\indent
\@faAbstract
\vskip 1cm
{\zarXIIIB واژه‌های کلیدی:}
\@keywords

}


% -------------------------------------------------------------------------------------------------------- English vtitle 
\newcommand{\envtitle}{

\ifthenelse{\isundefined{\@enfaculty}}
{
	\faculty{\warningText{Specify faculty name in English.}}
}{}

\ifthenelse{\isundefined{\@entitle}}
{ 	\title{\warningText{Specify report title in English}}
}{}

\ifthenelse{\isundefined{\@endepartment}}
{
	\department{ \warningText{Specify department in English} }
}
{}

\ifthenelse{\isundefined{\@enfield}}
{
	\field{\warningText{Specify field in English} }
}
{

}

\newpage
\pagestyle{empty}
\baselineskip=0.7cm




\newpage
\shortbioPage
\newpage
\enabstractPage
\eninVolumeTitle
\enonCoverTitle

}

% -------------------------------------------------------------------------------------------------------- End English vtitle 

% -------------------------------------------------------------------------------------------------- English on cover title

\newcommand{\shortbioPage}{
\begin{RTL}
\begin{persian}
{\noindent\zarXVIB کارنامک}\\

\framebox{
\begin{minipage}[t][0.4\textheight][t]{\textwidth}
\zarXII
\@shortbio
\end{minipage}
}\\




\framebox{
\begin{minipage}[t][0.4\textheight][t]{\textwidth}
\begin{LTR}
\timesXII
\@enshortbio
\end{LTR}
\end{minipage}
}

\end{persian}
\end{RTL}
}


\newcommand{\enabstractPage}{
{\noindent\timesXVIIIB Abstract}\\
\timesXII
\indent
\@enAbstract
\vskip 1cm
{\timesXIVB Keywords: }
\@enkeywords
}


% ---------------------------------------------------------------------------------------------------------------  Persian in-volume title page

\newcommand{\inVolumeTitle}{

\begin{titlepage}
\vspace{-2cm}\centerline{{\includegraphics[height=4.3cm]{pics/logolarge}}}

\vspace{-.2cm}
{\zarXIIIB  دانشگاه الزهرا (س) }
\par
{\zarXIIB \@faculty }
%\vspace{-.4cm}\@department}
\vskip .5cm

{\zarXIIB \reportLabel \gradeLabel }
\par
{\zarXIIB  رشته
\@subject \xspace
 گرایش 
\@field}
\vskip 1cm

{\zarXVIIIB عنوان \reportLabel}
\vskip .1cm
{\begin{spacing}{1.5}\Large \zarXVIIIB  \@title \end{spacing}}
\vskip 1.5cm
{\zarXIIB دانشجو}\par
{\zarXIVB  \@name ~ \@surname }
\vskip 1cm
\supervisorLabel[\zarXIIB][\zarXIIB \par][\par]
\vskip 1cm
\advisorLabel[\zarXIIB][\zarXIIB\par][\par]
\vskip 1cm
{\zarXIIB \bfseries \@thesisdate}
%\vfill
\end{titlepage}%
}


%-------------------------------------------------------------------------------------------------

% --------------------------------------------------------------------------------------------------- Draft title page
\newcommand{\DraftModeTitle}{
\begin{titlepage}


\vspace{-.2cm}
{\zarXIIIB  دانشگاه الزهرا (س) }
\par
{\zarXIIB \@faculty }
%\vspace{-.4cm}\@department}
\vskip .5cm

{\zarXIIB \reportLabel \gradeLabel }
\par
{\zarXIIB  رشته
\@subject \xspace
 گرایش 
\@field}
\vskip 1cm

{\zarXVIIIB عنوان \reportLabel}
\vskip .1cm
{\begin{spacing}{1.5} \Large \zarXVIIIB  \@title \end{spacing}}
\par
{\begin{latin}\begin{spacing}{1.5} \Large \timesXVIIIB  \@entitle \end{spacing}\end{latin}}
\vskip 1.5cm
{\zarXIIB دانشجو}\par
{\zarXIVB  \@name ~ \@surname }
\vskip 1cm
\supervisorLabel[\zarXIIB][\zarXIIB \par][\par]
\vskip 3cm
\vskip 1cm
{\zarXIIB \bfseries \@thesisdate}
%\vfill
\end{titlepage}%


}


% ---------------------------------------------------------------------------------------------------------------  Persian in-volume title page

\newcommand{\onCoverTitle}{

\begin{titlepage}
\vspace{-2cm}\centerline{{\includegraphics[height=4.3cm]{pics/logolarge}}}

\vspace{-.2cm}
{\zarXIIIB  دانشگاه الزهرا (س) }
\par
{\zarXIIB \@faculty }
%\vspace{-.4cm}\@department}
\vskip .5cm

{\zarXIIB \reportLabel \gradeLabel }
\par
{\zarXIIB  رشته
\@subject \xspace
 گرایش 
\@field}
\vskip 1cm

{\zarXVIIIB عنوان \reportLabel}
\vskip .1cm
{\begin{spacing}{1.5} \Large \zarXVIIIB  \@title \end{spacing}}
\vskip 1.5cm
{\zarXIIB دانشجو}\par
{\zarXIVB  \@name ~ \@surname }
\vskip 1cm
\supervisorLabel[\zarXIIB][\zarXIIB \par][\par]
\vskip 3cm
\vskip 1cm
{\zarXIIB \bfseries \@thesisdate}
%\vfill
\end{titlepage}%
}


%-------------------------------------------------------------------------------------------------


% English on cover title



\newcommand{\enonCoverTitle}{

\begin{titlepage}
\vspace{-2cm}\centerline{{\includegraphics[height=4.3cm]{pics/enlogolarge}}}

\vspace{-.2cm}
{\timesXIIIB  Alzahra University}
\par
{\timesXIIB Faculty of \@enfaculty }\\
{\timesXIIB Department of \@endepartment }

\vskip .5cm

{\timesXIIB A \enreportLabel Submitted in Partial Fulfillment of the Requirements for
 the Degree of \engradeLabel in \@ensubject \xspace (\@enfield)}
\par
\vskip 1cm

{\timesXXB Title}
\vskip .1cm
{\begin{spacing}{1.3}\Large \timesXVIIIB  \@entitle  \end{spacing}}
\vskip 1.5cm
{\timesXIIB By}\par
{\timesXIVB  \@enname ~ \@ensurname }
\vskip 1cm
\ensupervisorLabel[\timesXIIB][\timesXIIB \par][\par]
\vskip 1cm

{\timesXIIB \@enthesisdate}

\end{titlepage}%

}
% -------------------------------------------------------------------------------------------------- English in volume title

\newcommand{\eninVolumeTitle}{

\begin{titlepage}
\vspace{-2cm}\centerline{{\includegraphics[height=4.3cm]{pics/enlogolarge}}}

\vspace{-.2cm}
{\timesXIIIB  Alzahra University}
\par
{\timesXIIB Faculty of \@enfaculty }\\
{\timesXIIB Department of \@endepartment }

\vskip .5cm

{\timesXIIB A \enreportLabel Submitted in Partial Fulfillment of the Requirements for
 the Degree of \engradeLabel in \@ensubject (\@enfield)}
\par
\vskip 1cm

{\timesXXB Title}
\vskip .1cm
{\begin{spacing}{1.3}\Large \timesXVIIIB  \@entitle \end{spacing}}
\vskip 1.5cm
{\timesXIIB By}\par
{\timesXIVB  \@enname ~ \@ensurname }
\vskip 1cm
\ensupervisorLabel[\timesXIIB][\timesXIIB \par][\par]
\vskip 1cm
\enadvisorLabel[\timesXIIB][\timesXIIB \par][\par]
\vskip 1cm
{\timesXIIB  \@enthesisdate}

\end{titlepage}%

}

% ----------------------------------------------------------------------------------------------------- English in volume title

%%% ----------------------------------------------------------------------------------> Definition of English specification table
\newcommand{\enthesisSpecificationTable}{
\bgroup
\begin{LTR}
\begin{latin}

\def\arraystretch{1.3}
\begin{spacing}{1.2}
\begin{tabular}{|l|l|} \hline
\multicolumn{2}{|c|}{
\begin{minipage}{\textwidth}
{\timesXIVB Title:}
{\timesXIII \@entitle}
\end{minipage}
} 
\\\hline
\begin{minipage}{0.5\textwidth}
{\timesXIB Surname:}
{\timesXI \@ensurname} 
\end{minipage}
&
\begin{minipage}{0.5\textwidth}
{\timesXIB Name:}
{\timesXI \@enname} 
\end{minipage}
\\\hline
\begin{minipage}[t]{0.5\textwidth}
{\timesXB First Supervisor:}
{\timesXI \@enfirstsupervisor} \\
{\timesXB Affiliation:}
{\timesXI \@enfirstsupervisoraffiliation} \\
\end{minipage}
&
\begin{minipage}[t]{0.5\textwidth}
{\timesXB Second Supervisor:}
\ifx\@secondsupervisor\undefined
{\timesXI None}
\else
{\timesXI \@ensecondsupervisor}\fi \\
{\timesXB Affiliation:}
\ifx\@secondsupervisor\undefined
\else
{\timesXI \@ensecondsupervisoraffiliation} \fi
\end{minipage}
\\\hline
\begin{minipage}[t]{0.5\textwidth}
{\timesXB First Advisor:}
\ifx\@firstadvisor\undefined
{\timesXI None} 
\else
{\timesXI \@enfirstadvisor}\fi \\
{\timesXB Affiliation:}
\ifx\@firstadvisor\undefined
\else
{\timesXI \@enfirstadvisoraffiliation} \fi \\
\end{minipage}
&
\begin{minipage}[t]{0.5\textwidth}
{\timesXB Second Advisor:}
\ifx\@secondadvisor\undefined
{\timesXI None}
\else
{\timesXI \@ensecondadvisor}\fi \\
{\timesXB Affiliation:}
\ifx\@secondadvisor\undefined
\else
{\timesXI \@ensecondadvisoraffiliation} \fi\\
\end{minipage}
\\\hline
\multicolumn{2}{|l|}{
\begin{minipage}[t]{0.5\textwidth}
{\timesXIB Degree:} {\timesXI \engradeLabel}\\
{\timesXIB Department:} {\timesXI \@endepartment}\\
{\timesXIB Faculty:} {\timesXI \@enfaculty}\\
{\timesXIB  Alzahra University}\\
\end{minipage}
}
\\\hline
{\timesXIB Subject:} {\timesXI \@ensubject}
&
{\timesXIB Field:} {\timesXI \@enfield}
\\\hline
\multicolumn{2}{|c|}{
\begin{minipage}[t][10cm][t]{\textwidth}
{\timesXIB Abstract:} \timesXI \@enAbstract
\end{minipage}
}
\\\hline
\multicolumn{2}{|l|}{
{\timesXIB Keywords:} \timesXI \@enkeywords
}
\\\hline

\end{tabular}
\end{spacing}
\end{latin}
\end{LTR}
\egroup
}

\newcounter{lpage}

%%% ----------------------------------------------------------------------------------> End definition of English specification table

%%% ----------------------------------------------------------------------------------> Definition of persian specification table
\newcommand{\thesisSpecificationTable}{
\bgroup
\def\arraystretch{1.3}
\begin{tabular}{|r|r|} \hline
\multicolumn{2}{|c|}{
\begin{minipage}{\textwidth}
{\zarXIIB عنوان:}
{\zarXIV \@title}\\


\end{minipage}
} 
\\\hline
\begin{minipage}{0.5\textwidth}
{\zarXB نام‌خانوادگی:}
{\zarXI \@surname} 
\end{minipage}
&
\begin{minipage}{0.5\textwidth}
{\zarXB نام:}
{\zarXI \@name} 
\end{minipage}
\\\hline
\begin{minipage}[t]{0.5\textwidth}
{\zarXB استاد راهنمای اول:}
{\zarXI \@firstsupervisor} \\
{\zarXB وابستگی سازمانی:}
{\zarXI \@firstsupervisoraffiliation} \\
\end{minipage}
&
\begin{minipage}[t]{0.5\textwidth}
{\zarXB استاد راهنمای دوم:}
\ifx\@secondsupervisor\undefined
{\zarXI ندارد}
\else
{\zarXI \@secondsupervisor}\fi \\
{\zarXB وابستگی سازمانی:}
\ifx\@secondsupervisor\undefined
\else
{\zarXI \@secondsupervisoraffiliation} \fi
\end{minipage}
\\\hline
\begin{minipage}[t]{0.5\textwidth}
{\zarXB استاد مشاور اول:}
\ifx\@firstadvisor\undefined
{\zarXI ندارد} 
\else
{\zarXI \@firstadvisor}\fi \\
{\zarXB وابستگی سازمانی:}
\ifx\@firstadvisor\undefined
\else
{\zarXI \@firstadvisoraffiliation} \fi \\
\end{minipage}
&
\begin{minipage}[t]{0.5\textwidth}
{\zarXB استاد مشاور دوم:}
\ifx\@secondadvisor\undefined
{\zarXI ندارد}
\else
{\zarXI \@secondadvisor}\fi \\
{\zarXB وابستگی سازمانی:}
\ifx\@secondadvisor\undefined
\else
{\zarXI \@secondadvisoraffiliation} \fi\\
\end{minipage}
\\\hline
\multicolumn{2}{|r|}{
\begin{minipage}[t]{0.5\textwidth}
{\zarXIB مقطع:} {\zarXI \gradeLabel}\\
{\zarXIB گروه:} {\zarXI \@department}\\
{\zarXIB دانشکده:} {\zarXI \@faculty}\\
{\zarXIB   دانشگاه الزهرا (س)  }\\
\end{minipage}
}
\\\hline
{\zarXIB رشته/گرایش:} {\zarXI \@subject / \@field}
&
{\zarXIB زمینه پژوهش:}
\\\hline
\multicolumn{2}{|c|}{
\begin{minipage}[t][10cm][t]{\textwidth}
{\zarXIB چکیده:} \@faAbstract
\end{minipage}
}
\\\hline
\multicolumn{2}{|r|}{
{\zarXIB کلیدواژه‌ها:} \@keywords
}
\\\hline

\end{tabular}
\egroup

}

%%% ----------------------------------------------------------------------------------> End definition of persian specification table

%
%\def\frame{\newpage
%\thispagestyle{empty}
%\begin{framed}\thispagestyle{empty}}
%\def\endframe{\thispagestyle{empty}\end{framed}
%\thispagestyle{empty}
%\newpage
%}
%
%
\def\titlepage{\newpage\centering
  \thispagestyle{empty}
  \parindent 0pt \parskip 10pt plus 1fil minus 1fil
  \def\baselinestretch{1}\@normalsize\vbox to \vsize\bgroup\vbox to 9in\bgroup}
\def\endtitlepage{\par\kern 0pt\egroup\vss\egroup\newpage}



%\csname@twosidetrue\endcsname
%\pagestyle{fancy}
%\fancyhf{} 
%\fancyhead[OL,ER]{\thepage}
%\fancyhead[OR]{\small\rightmark}
%\fancyhead[EL]{\small\leftmark}
%
%
%
%\titleformat{\subsection}{\subsectionfont\bfseries}{\thesubsection}{1em}{}
%\titleformat{\section}{\sectionfont\bfseries}{\thesection}{1em}{}
%\renewcommand\thesection{\thechapter-\arabic{section}.}
%\renewcommand\thesubsection{\thechapter-\arabic{section}-\arabic{subsection}.}
%\renewcommand\thefigure{\thechapter-\arabic{figure}}
%\renewcommand\thetable{\thechapter-\arabic{table}}
%
%\renewcommand{\chaptermark}[1]{%
%\markboth{\thechapter.\ #1}{}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% دستورهایی برای سفارشی کردن صفحات اول فصل‌ها
%\makeatletter
%\newcommand\mycustomraggedright{%
% \if@RTL\raggedleft%
% \else\raggedright%
% \fi}
%\def\@part[#1]#2{%
%\ifnum \c@secnumdepth >-2\relax
%\refstepcounter{part}%
%\addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
%\else
%\addcontentsline{toc}{part}{#1}%
%\fi
%\markboth{}{}%
%{\centering
%\interlinepenalty \@M
%\ifnum \c@secnumdepth >-2\relax
% \huge\bfseries \partname\nobreakspace\thepart
%\par
%\vskip 20\p@
%\fi
%\Huge\bfseries #2\par}%
%\@endpart}
%\def\@makechapterhead#1{%
%\vspace*{-30\p@}%
%{\parindent \z@ \mycustomraggedright %\@mycustomfont
%\ifnum \c@secnumdepth >\m@ne
%\if@mainmatter
%
%%\huge\bfseries \@chapapp\space {\chapternumber\thechapter}
%\chapterfont\bfseries \@chapapp\space {\chapternumber\thechapter}
%\par\nobreak
%\vskip 20\p@
%\fi
%\fi
%\interlinepenalty\@M 
%\Huge \bfseries #1\par\nobreak
%\vskip 120\p@
%}}
%\makeatother

%\doublespacing
%
%\doublespacing
%\linespread{1.9}
%}
\renewcommand{\chaptermark}[1]{%
\markboth{\thechapter\ #1}{}}

%\def\theCommands{
%\makeatletter
%\csname@twosidetrue\endcsname
%\makeatother

\pagestyle{fancy}
\fancyhf{} 
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
%\renewcommand{\sectionmark}[1]{ \markright{#1}{} }
%\renewcommand{\chaptermark}[1]{ \marboth{#1}{} }
\fancyhead[OL,ER]{\thepage}
%\fancyhead[OR]{\rightmark}
\fancyhead[OR]{\leftmark}
\fancyhead[EL]{\@title}

\let\oldTOC=\tableofcontents
\def\tableofcontents{\phantomsection\oldTOC} %\setcounter{page}{1}}

\let\oldTTOC=\listoftables
\def\listoftables{\phantomsection\oldTTOC}

\let\oldFTOC=\listoffigures
\def\listoffigures{\phantomsection\oldFTOC}

\titleformat{\subsection}{\subsectionfont\bfseries}{\thesubsection}{1em}{}
\titleformat{\section}{\sectionfont\bfseries}{\thesection}{1em}{}
\titleformat{\chapter}{\chapterfont\bfseries}{\thechapter}{1em}{}
\renewcommand\thesection{\thechapter.\arabic{section}.}
\renewcommand\thesubsection{\thechapter.\arabic{section}.\arabic{subsection}.}
\renewcommand\thefigure{\thechapter.\arabic{figure}}
\renewcommand\thetable{\thechapter.\arabic{table}}



\twocolumnfootnotes
%}


\AtEndDocument{ 

\if@draftmode
\begin{latin}
\newpage
\enabstractPage
\end{latin}
\else


\baselineskip=.6cm
\begin{latin}
\envtitle
\end{latin}
\fi

}

\doublespacing
\linespread{1.9}
