const path = require('path')
const exec = require('child_process').exec 
const env = process.env  
const fileList = Array.prototype.slice.call(process.argv,2) 
const INIT_CWD = env.INIT_CWD   
const absoulteAsmFileList = fileList.map(asmFileName=> path.join(INIT_CWD,asmFileName) ) 
absoulteAsmFileList.forEach(path_=>{ 
    exec(`nasm -f bin ${path_} -o D:\\OS\\out.bin`,err=>{
        if(!err) return console.log("编译成功!")  
        console.error(err)
    })
})


