#include <Python.h>


static PyObject* c_grep(PyObject* self, PyObject *args)
{
    FILE *f;
    const char *filename;
    const char *pattern;
    long position;
    char buffer[100];
    PyObject *lst = PyList_New(0);
    PyObject *num;

    
    if (!PyArg_ParseTuple(args, "ss", &filename, &pattern))
        return NULL;
 
    if ((f = fopen(filename, "r")) == NULL) {
        PyErr_SetString(PyExc_IOError,"File not Found");
        return NULL;
    }   
    while(fgets(buffer, sizeof(buffer), f)) {
        if (strstr(buffer, pattern)) {
            position = ftell(f);
            num = PyInt_FromLong(position);
            PyList_Append(lst,num);
        }
    }
    return Py_BuildValue("O", lst);
}

static char c_grep_docs[] =
    "c_grep(filename, pattern): return the position of the pattern in the file(in bytes)\n";

static PyMethodDef c_grep_funcs[] = {
    {"c_grep", c_grep, 
     METH_VARARGS, c_grep_docs},
    {NULL, NULL, 0, NULL}
};

PyMODINIT_FUNC

initc_grep(void)
{
    (void)Py_InitModule("c_grep", c_grep_funcs);
}
