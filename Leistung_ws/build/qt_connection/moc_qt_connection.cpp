/****************************************************************************
** Meta object code from reading C++ file 'qt_connection.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/qt_connection/src/qt_connection.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'qt_connection.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_ConnectClass_t {
    QByteArrayData data[12];
    char stringdata0[132];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ConnectClass_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ConnectClass_t qt_meta_stringdata_ConnectClass = {
    {
QT_MOC_LITERAL(0, 0, 12), // "ConnectClass"
QT_MOC_LITERAL(1, 13, 13), // "slotGameStart"
QT_MOC_LITERAL(2, 27, 0), // ""
QT_MOC_LITERAL(3, 28, 18), // "slotDetectionStart"
QT_MOC_LITERAL(4, 47, 12), // "slotGameOver"
QT_MOC_LITERAL(5, 60, 12), // "slotAbValues"
QT_MOC_LITERAL(6, 73, 1), // "a"
QT_MOC_LITERAL(7, 75, 1), // "b"
QT_MOC_LITERAL(8, 77, 16), // "slotStopMovement"
QT_MOC_LITERAL(9, 94, 13), // "slotTeamColor"
QT_MOC_LITERAL(10, 108, 9), // "TeamColor"
QT_MOC_LITERAL(11, 118, 13) // "slotSendAlive"

    },
    "ConnectClass\0slotGameStart\0\0"
    "slotDetectionStart\0slotGameOver\0"
    "slotAbValues\0a\0b\0slotStopMovement\0"
    "slotTeamColor\0TeamColor\0slotSendAlive"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ConnectClass[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   49,    2, 0x0a /* Public */,
       3,    0,   50,    2, 0x0a /* Public */,
       4,    0,   51,    2, 0x0a /* Public */,
       5,    2,   52,    2, 0x0a /* Public */,
       8,    0,   57,    2, 0x0a /* Public */,
       9,    1,   58,    2, 0x0a /* Public */,
      11,    0,   61,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Double, QMetaType::Double,    6,    7,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 10,    2,
    QMetaType::Void,

       0        // eod
};

void ConnectClass::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        ConnectClass *_t = static_cast<ConnectClass *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->slotGameStart(); break;
        case 1: _t->slotDetectionStart(); break;
        case 2: _t->slotGameOver(); break;
        case 3: _t->slotAbValues((*reinterpret_cast< double(*)>(_a[1])),(*reinterpret_cast< double(*)>(_a[2]))); break;
        case 4: _t->slotStopMovement(); break;
        case 5: _t->slotTeamColor((*reinterpret_cast< TeamColor(*)>(_a[1]))); break;
        case 6: _t->slotSendAlive(); break;
        default: ;
        }
    }
}

const QMetaObject ConnectClass::staticMetaObject = {
    { &QThread::staticMetaObject, qt_meta_stringdata_ConnectClass.data,
      qt_meta_data_ConnectClass,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *ConnectClass::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ConnectClass::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_ConnectClass.stringdata0))
        return static_cast<void*>(const_cast< ConnectClass*>(this));
    return QThread::qt_metacast(_clname);
}

int ConnectClass::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QThread::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
