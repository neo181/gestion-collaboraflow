const sqlite3 = require('sqlite3').verbose();
const fs = require('fs');

// Crear base de datos SQLite
const db = new sqlite3.Database('./database.sqlite');

// Ejecutar schema
const schema = fs.readFileSync('./schema.sqlite.sql', 'utf8');
db.exec(schema, (err) => {
    if (err) {
        console.error('Error creating database:', err);
    } else {
        console.log('Database created successfully!');
    }
});

db.close();