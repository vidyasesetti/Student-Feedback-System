
const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const session = require('express-session');
const path = require('path');
const flash = require('connect-flash');
const app = express();


const db = mysql.createConnection({
  host: 'localhost', 
  user: 'root',
  password: '',
  database: 'studentFeedback'
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('MySQL Connected...');
});
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(flash());
app.use(express.static(path.join(__dirname, 'static')));

app.use(session({
  secret: 'secret',
  resave: true,
  saveUninitialized: true
}));
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', (req, res) => {
    res.render('index');
});
app.post('/register',(req,res)=>{
  res.redirect('/');
});
app.get('/login',(req,res)=>{
  res.render('login');
});
app.get('/login2',(req,res)=>{
  res.render('login2');
});
app.get('/register',(req,res)=>{
  res.render('register');
});
app.get('/stu_login',(req,res)=>{
  res.render('stu_login');
});
app.get('/fac_login',(req,res)=>{
  res.render('fac_login');
});
app.get('/alum_login',(req,res)=>{
  res.render('alum_login');
});
app.get('/parent_login',(req,res)=>{
  res.render('parent_login');
});
app.get('/alumMain',(req,res)=>{
  res.render('/alumMain');
});
app.get('/changePassword', (req, res) => {
  res.render('changePassword');
});
app.get('/studentMain',(req,res)=>{
  res.redirect('/');
});
app.post('/stu_login', (req, res) => {
  const { userType} = req.body;
  console.log(`User selected type: ${userType}`);
      const {studentId,studentPassword}=req.body;
      const sql = 'SELECT * FROM student WHERE roll_no = ? AND password = ?';
      db.query(sql, [studentId, studentPassword], (err, result) => {
          if (err) {
              throw err;
          }
          if (result.length > 0) {
              req.session.studentId = studentId;
              const courseSql = `SELECT subject.subject_name, faculty.name FROM subject INNER JOIN faculty ON subject.faculty_id = faculty.faculty_id`;
              db.query(courseSql, (err, courseResults) => {
                  if (err) {
                      console.error('Error retrieving course details from database:', err);
                      res.status(500).send('Internal Server Error');
                      return;
                  }
      
                  const courses = courseResults;
      
                  res.render('studentMain.ejs', { student:result[0],courses });
              });
          
      }
      else {
          // If faculty credentials are incorrect, redirect to login page or show error message
          res.send('Invalid student credentials');
      }
      
  }  );
});

app.get('/sdashboard', (req, res) => {
  if (req.session && req.session.studentId) {
      const studentId = req.session.studentId;
      const sql = 'SELECT * FROM student WHERE roll_no = ?';
      db.query(sql, [studentId], (err, result) => {
          if (err) {
              throw err;
          }
          if (result.length > 0) {
              // If student data is found, render sdashboard.ejs with student data
              res.render('sdashboard', { student: result[0] });
          } else {
              // If student data is not found, redirect to login page or show error message
              res.send('Student data not found');
          }
      });
  } else {
      // If studentId is not in session, redirect to login page
      res.redirect('/');
  }
});

app.post('/fac_login', (req, res) => {
  const { facultyId, facultyPassword ,userType} = req.body;
  const sql = 'SELECT * FROM faculty WHERE faculty_id = ? AND password = ?';
  db.query(sql, [facultyId, facultyPassword], (err, result) => {
      if (err) {
          throw err;
      }
      if (result.length > 0) {
          const fname = result[0].name;
          const status=result[0].status;
          // console.log(`status: ${status}`);
          req.session.facultyId = facultyId;
          req.session.userType= userType;
          const q1 = 'SELECT subject_name FROM subject WHERE faculty_id=?';
          db.query(q1, [facultyId], (err, res1) => {
              if (err) {
                  throw err;
              }
              const dataToSend = {
                fname: fname,
                subjects: res1,
                status: status
            };          
                  res.render('facultyMain', dataToSend);
          });
      } else {
          res.send('Invalid faculty credentials');
      }
});
});

app.post('/alum_login', (req, res) => {
  const { alumId, alumPassword ,userType} = req.body;
  req.session.userType=userType;
  req.session.alumniId = alumId;
  req.session.alumniPassword = alumPassword;
    const sql = 'SELECT * FROM student WHERE passedout_status=1 AND roll_no = ? AND password = ?';
      db.query(sql, [alumId,alumPassword], (err, result) => {
          if (err) {
              throw err;
          }
          const status=result[0].status;
          // console.log(`status: ${status}`);
          if (result.length === 0) {
            res.render('alum_login', { error: 'Invalid alumni ID or password' });
          } else {
            const status = result[0].status;
            res.render('alumniMain', { alumni: result[0], status: status });
          }
          
      });
});
app.post('/parent_login', (req, res) => {
  const { stuId,phn_no,userType} = req.body;
  req.session.userType=userType;
  req.session.stuId = stuId;
  req.session.phn_no = phn_no;
    const sql = 'SELECT * FROM student WHERE roll_no = ? AND parent_phn_no= ?';
      db.query(sql, [stuId,phn_no], (err, result) => {
          if (err) {
              throw err;
          }
          if (result.length === 0) {
            res.render('parent_login', { error: 'Invalid parent phone number or ID' });
          } 
          else{
            const sql='select * from parent where student_rollno=?';
            db.query(sql,[stuId],(err,results)=>{
              const status=results[0].status;
            res.render('parentMain', { student: result[0], parent:results[0],status: status });
            });
          }  
      });
});
app.post('/stu_login', (req, res) => {
  const { studentId, studentPassword ,userType} = req.body;
  req.session.studentId=studentId;
  req.session.userType=userType;
  const sql = 'SELECT * FROM student WHERE student_id = ? AND password = ?';
  db.query(sql, [studentId, studentPassword], (err, result) => {
      if (err) {
          throw err;
      }
      if (result.length > 0) {
          const stuname = result[0].name;
          const status=result[0].status;
          req.session.studentId = studentId;
          req.session.userType= userType;
          
                  res.render('studentMain',{studentId});
          }
       else {
          res.send('Invalid student credentials');
      }
});
});
app.get('/stu_dashboard', (req, res) => {
  const stuId = req.session.stuId;
  
  const sql = 'SELECT * FROM student WHERE roll_no=? ';
  db.query(sql, [stuId], (err, result) => {
      if (err) {
          throw err;
      }
      if (result.length > 0) {
          res.render('stu_dashboard', { student: result[0] });
      } else {
          res.send('Invalid student credentials');
      }
  });
});
app.get('/al_dashboard', (req, res) => {
  const alumniId = req.session.alumniId;
  const alumniPassword = req.session.alumniPassword;
  if (!alumniId || !alumniPassword) {
      res.send('Invalid session');
      return;
  }
  const sql = 'SELECT * FROM student WHERE passedout_status=1 AND roll_no=? and password=?';
  db.query(sql, [alumniId, alumniPassword], (err, result) => {
      if (err) {
          throw err;
      }
      if (result.length > 0) {
          res.render('al_dashboard', { alumni: result[0] });
      } else {
          res.send('Invalid alumni credentials');
      }
  });
});
app.post('/p_feedback', (req, res) => {
  const roll = req.session.stuId;
  const phn_no=req.session.phn_no;
  const q1 = req.body.q1;
  const q2 = req.body.q2;
  const q3 = req.body.q3;
  const q4 = req.body.q4;
  const q5 = req.body.q5;
  const q6 = req.body.q6;
  const q7 = req.body.q7;
  const sql = 'INSERT INTO p_feedback (roll_no,q1,q2,q3,q4,q5,q6,q7) VALUES (?,?,?,?,?,?,?,?)';
  db.query(sql, [roll, q1, q2,q3,q4,q5,q6,q7], (err, result1) => {
    if (err) {throw err;}
    const sql='UPDATE parent set status=1 where student_rollno=?';
    db.query(sql,[roll],(err,res3)=>{
      if (err) {
        throw err;
    }
      const sql = 'SELECT * FROM student WHERE roll_no = ? AND parent_phn_no= ?';
      db.query(sql, [roll,phn_no], (err, result) => {
        if (err) {
          throw err;
      }
        const sql='select * from parent where student_rollno=?';
            db.query(sql,[roll],(err,results)=>{
              if (err) {
                throw err;
            }
              const status=results[0].status;
            res.render('parentMain', { student: result[0], parent:results[0],status: status });
            });
        
    });
    });
    
  });

});

app.post('/alfeedback', (req, res) => {
  const roll = req.session.alumniId;
  const alumniId=req.session.alumniId;
  const alumniPassword=req.session.alumniPassword;
  const q1 = req.body.q1;
  const q2 = req.body.q2;
  const q3 = req.body.q3;
  const q4 = req.body.q4;
  const q5 = req.body.q5;
  const q6 = req.body.q6;
  const q7 = req.body.q7;
  const sql = 'INSERT INTO alfeedback (roll_no, q1, q2,q3,q4,q5,q6,q7) VALUES (?, ?, ?,?,?,?,?,?)';
  db.query(sql, [roll, q1, q2,q3,q4,q5,q6,q7], (err, result) => {
    if (err) {throw err;}
    const sql='UPDATE student set status=1 where roll_no=?';
    db.query(sql,[alumniId],(err,res3)=>{
      if (err) {
        throw err;
    }
      const sql = 'SELECT * FROM student WHERE passedout_status=1 AND roll_no = ? AND password = ?';
      db.query(sql, [alumniId,alumniPassword], (err, result) => {
        
        const status=result[0].status;
        // console.log(`status: ${status}`);
        res.render('alumniMain', { alumni: result[0],status:status });
        
    });
    });
    
  });

});

app.get('/stat',(req,res)=>{
  res.render('tem2');
});



app.post('/facultyMain', (req, res) => {
  const facultyId = req.session.facultyId; 
  const subject = req.body.subject;
  const q1 = req.body.q1;
  const q2 = req.body.q2;
  const q3 = req.body.q3;
  const q4 = req.body.q4;
  const q5 = req.body.q5;
  const q6 = req.body.q6;
  const q7 = req.body.q7;

  const sql = 'INSERT INTO faculty_feedback (faculty_id, subject_name, q1, q2,q3,q4,q5,q6,q7) VALUES (?, ?, ?, ?,?,?,?,?,?)';
  db.query(sql, [facultyId, subject, q1, q2,q3,q4,q5,q6,q7], (err, result) => {
    if (err) {
      console.error('Error inserting feedback:', err);
      res.status(500).send('Error submitting feedback');
    } 
  });

  const sq1='UPDATE  faculty set status=1 WHERE faculty_id=? ';
  db.query(sq1,[facultyId],(err,res2)=>{
    if(err) throw err;
    else {
      // console.log('Feedback submitted successfully');
          const q1 = 'SELECT subject_name FROM subject WHERE faculty_id=?';
          db.query(q1, [facultyId], (err, res1) => {
              if (err) {
                  throw err;
              }
              const sql='SELECT * FROM faculty where faculty_id=?';
              db.query(sql,[facultyId],(err,result)=>{
                if (result.length > 0){
                  const fname = result[0].name;
                const status=result[0].status;
                const dataToSend = {
                  fname: fname,
                  subjects: res1,
                  status: status
                };    
              res.render('facultyMain', dataToSend);
                }
              });
          });
      }
    });
  });
app.post('/changePassword', (req, res) => {
  const { newPassword } = req.body;
  const userType = req.session.userType; 
  let tableName;
  if (userType === 'faculty') {
      tableName = 'faculty'; 
      const facultyId = req.session.facultyId;
      const sql = `UPDATE ${tableName} SET password = ? WHERE faculty_id = ?`;
      db.query(sql, [newPassword, facultyId], (err, result) => {
        if (err) {
            console.error('Error updating password:', err);
            return res.status(500).send('Internal Server Error');
        }
        res.send('<script>alert("Password updated successfully");</script>');
    });

  } else if (userType === 'alumni') {
      tableName = 'student'; 
      const alumniId = req.session.alumniId;
     const sql = `UPDATE ${tableName} SET password = ? WHERE roll_no= ?`;
     db.query(sql, [newPassword, alumniId], (err, result) => {
      if (err) {
          console.error('Error updating password:', err);
          return res.status(500).send('Internal Server Error');
      }
      res.send('<script>alert("Password updated successfully");</script>');
  });
  } 
  else if (userType === 'student') {
    tableName = 'student'; 
    const studentId = req.session.studentId;
   const sql = `UPDATE ${tableName} SET password = ? WHERE roll_no= ?`;
   db.query(sql, [newPassword, studentId], (err, result) => {
    if (err) {
        console.error('Error updating password:', err);
        return res.status(500).send('Internal Server Error');
    }
    res.send('<script>alert("Password updated successfully");</script>');
});
  }
  else {
      return res.status(400).send('Invalid userType');
  }
});






app.get('/fdashboard', (req, res) => {
    const facultyId = req.session.facultyId;
    if (facultyId) {
        const sql = 'SELECT * FROM faculty WHERE faculty_id = ?';
        db.query(sql, [facultyId], (err, result) => {
            if (err) {
                throw err;
            }
            if (result.length > 0) {
                res.render('fdashboard', { faculty: result[0] });
            } else {
                res.send('Faculty data not found');
            }
        });
    } else {
        res.send('Unauthorized access');
    }
});


app.get('/logout', (req, res) => {
    req.session.destroy((err) => {
      if (err) {
        console.error('Error destroying session:', err);
        res.status(500).send('Internal Server Error');
        return;
      }
      res.redirect('/');
    });
  });

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
