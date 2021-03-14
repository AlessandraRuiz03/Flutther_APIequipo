const express = require('express')
const router = express.Router()

const mysqlconection = require('../database')

router.get('/', (req, res) =>{
    mysqlconection.query('SELECT * FROM users', (err, rows, fields) => {
        if (!err){
            res.json(rows)
        } else {
            console.log(err)
            res.json({Error:"Ha ocurrido un error en el servidor"})
        }
    })
})

router.get('/:id', (req, res) => {
    const { id } = req.params
    mysqlconection.query('SELECT * FROM users WHERE id = ?', [id], (err, rows, fields) => {
        if (!err){
            if (rows == ""){
                res.json({Error:"No hay usuarios con ese id"})
            } else {
                res.json(rows[0])
            }
        } else {
            console.log(err)
            res.json({Error:"A ocurrido un error"})
        }
    })
})

router.post('/', (req, res) => {
    const { usuario, contra } = req.body
    if(usuario && contra) {
        const query = `CALL userAddOrEdit(?, ?, ?, ?, ?, ?, ?, ?);`
        mysqlconection.query(query, ["0", usuario, contra, "", "", "", "", ""], (err, rows, fields) => {
            if(!err){
                res.json({Status: 'User saved'})
            } else {
                console.log(err);
                res.json({Error : "El usuario ya existe"})
            }
        })
    } else {
        res.json({Error:"Se enviaron los valores correctos"})
    }
})

router.put('/:id', (req, res) => {
    const { imagen, nombre, apellido, direccion, edad } = req.body
    const { id } = req.params
    console.log("Entro al put")
    mysqlconection.query('SELECT * FROM users WHERE id = ?', [id], (err, rows, fields) => {
        if (!err){
            if (rows == ""){
                res.json({Error:"No hay usuarios con ese id"})
            } else {
                if (imagen && nombre && apellido && direccion && edad){
                    const query = `CALL userAddOrEdit(?, ?, ?, ?, ?, ?, ?, ?);`
                    console.log(id)
                    mysqlconection.query(query, [id, "", "", imagen, nombre, apellido, direccion, edad], (err, rows, filds)=>{
                        if (!err){
                            res.json({Status:"Usuario actualizado"})
                        } else {
                            console.log(err)
                            res.json({Error:"A ocurrido un error"})
                        }
                    })
                } else {
                    res.json({Error:"Faltan valores"})
                }
            }
        } else {
            console.log(err)
            res.json({Error:"A ocurrido un error"})
        }
    })
    
})

router.post('/search', (req, res) => {
    const { usuario } = req.body
    if (usuario) {
        mysqlconection.query('SELECT * FROM users WHERE usuario = ?', [usuario], (err, rows, filds) => {
            if (!err){
                if (rows == "") {
                    res.json({Error:"No hay personas con ese nombre de usuario"})
                } else {
                    res.json(rows[0])
                }
            } else {
                console.log(err)
                res.json({Error:"A ocurrido un error"})
            }
        })
    } else {
        res.json({Error:"No se envio nombre de usuario"})
    }
    
})

module.exports = router