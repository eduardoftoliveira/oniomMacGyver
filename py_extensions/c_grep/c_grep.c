#include <Python.h>

static PyObject* c_grep(PyObject* self, PyObject *args)
{
    FILE *f;
    const char *filename;
    long position;
    char buffer[100];
    int i;
    PyObject *lst  = PyList_New(0);
    PyObject *num;
    PyObject *line;
    PyObject *py_pattern_lst;

    if (!PyArg_ParseTuple(args, "sO", &filename, &py_pattern_lst))
        return NULL;

    // Check c_pattern_lst
    if (!PySequence_Check(py_pattern_lst)) {
        PyErr_SetString(PyExc_TypeError, "expected sequence");
        return NULL;
    }
    int n_patterns; 
    n_patterns = PyObject_Length(py_pattern_lst);

    char *c_pattern_lst[n_patterns];
    char *each_pattern; 
    PyObject * temp;
    int index;
    for (index = 0; index < n_patterns; index++) {
        /* get the element from the list/tuple */
        temp = PyList_GetItem(py_pattern_lst, index);   // temp is a PyUnicodeObject
        temp = PyUnicode_AsASCIIString(temp);           // temp becomes a PyBytesObject
        each_pattern = PyBytes_AsString(temp);          // each_pattern is a C string
        c_pattern_lst[index] = each_pattern;
    }

    if ((f = fopen(filename, "r")) == NULL) {
        PyErr_SetString(PyExc_IOError,"File not Found");
        return NULL;
    }   

    while(fgets(buffer, sizeof(buffer), f)) {
        for (i = 0; i < n_patterns; i++){
            //return Py_BuildValue("i", i);
            if (strstr(buffer, c_pattern_lst[i])) {
                //return Py_BuildValue("i", 88);
                position = ftell(f);
                num = PyLong_FromLong(position);
                line = PyUnicode_FromString(buffer);
                PyObject *byte_line_tuple = PyTuple_New(2);
                PyTuple_SET_ITEM(byte_line_tuple,0,num);
                PyTuple_SET_ITEM(byte_line_tuple,1,line);
                PyList_Append(lst, byte_line_tuple);
            }
        }
    }
    //return Py_BuildValue("S", c_pattern_lst[0]);
    return Py_BuildValue("O", lst);
}

static char c_grep_docs[] =
    "c_grep(filename, pattern): return the position of the pattern in the file(in bytes)\n";

static PyMethodDef c_grep_funcs[] = {
    {"c_grep", c_grep, 
     METH_VARARGS, c_grep_docs},
    {NULL, NULL, 0, NULL}
};

static struct PyModuleDef c_grep_module = {
    PyModuleDef_HEAD_INIT,
    "c_grep",
    c_grep_docs,
    -1,
    c_grep_funcs
};

PyMODINIT_FUNC

PyInit_c_grep(void)
{
    return PyModule_Create(&c_grep_module);
}
