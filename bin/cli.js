const path = require('path')
const exec = require('child_process').exec 
const env = process.env  
const fileList = Array.prototype.slice.call(process.argv,2)  
const outList = fileList.map(e=>`${e}.bin`)
const INIT_CWD = env.INIT_CWD   
const absoulteAsmFileList = fileList.map(asmFileName=> path.join(INIT_CWD,asmFileName) )  

for(let i = 0;i<absoulteAsmFileList.length;++i) {
    exec(`nasm -f bin ${absoulteAsmFileList[i]} -o D:\\OS\\${outList[i]}`,err=>{
        if(!err) return console.log("编译成功!")  
        console.error(err)
    })
}



