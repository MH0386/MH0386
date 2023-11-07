from pdflatex import PDFLaTeX

pdfl = PDFLaTeX.from_texfile("resume.tex")
pdf, log, completed_process = pdfl.create_pdf()
print(pdf)
