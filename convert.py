import subprocess

# Define the LaTeX content as a string
latex_content = r""

with open("resume.tex", "r") as file:
    latex_content = file.read().rstrip("\n")
print(latex_content)
# Write the LaTeX content to a file
with open("tmp.tex", "w") as f:
    f.write(latex_content)

# Call pdflatex to convert the LaTeX file to PDF
proc = subprocess.Popen(["pdflatex", "tmp.tex"])
proc.communicate()
