from distutils.core import setup, Extension
setup(name='c_grep', version='1.0',  \
            ext_modules=[Extension('c_grep', ['./c_grep/c_grep.c'])])
