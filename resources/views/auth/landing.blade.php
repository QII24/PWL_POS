<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rifqi Shop</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
            overflow: hidden;
        }

        /* Pola corak */
        body::before {
            content: "";
            position: absolute;
            top: -50px;
            left: -50px;
            width: 350px;
            height: 350px;
            background: url('https://www.toptal.com/designers/subtlepatterns/patterns/triangle-mosaic.png');
            opacity: 0.15;
            z-index: 0;
        }

        body::after {
            content: "";
            position: absolute;
            bottom: -50px;
            right: -50px;
            width: 350px;
            height: 350px;
            background: url('https://www.toptal.com/designers/subtlepatterns/patterns/triangle-mosaic.png');
            opacity: 0.15;
            z-index: 0;
        }

        .container {
            background: linear-gradient(135deg, #ffffff, #f0e9d2);
            padding: 60px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
            position: relative;
            z-index: 1;
        }
        
        h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            color: #2d3748;
            font-weight: 600;
        }
        
        p {
            font-size: 1.1rem;
            margin-bottom: 30px;
            color: #4a5568;
        }
        
        .contact-info {
            margin-bottom: 30px;
            font-size: 1rem;
            color: #4a5568;
        }
        
        .btn {
            padding: 12px 30px;
            font-size: 1rem;
            margin: 10px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            max-width: 200px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        .btn-login {
            background-color: #4FD1C5;
            color: white;
        }
        
        .btn-login:hover {
            background-color: #38b2ac;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(72, 187, 168, 0.2);
        }
        
        .btn-register {
            background-color: #F56565;
            color: white;
        }
        
        .btn-register:hover {
            background-color: #e53e3e;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(245, 101, 101, 0.2);
        }

        /* Transisi halus saat tombol disentuh */
        .btn:hover {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

    </style>
</head>
<body>

    <div class="container">
        <h1>Rifqi Shop</h1>
        <p>Your one-stop shop for quality products!</p>
        <div class="contact-info">
            <p>Jalan Bareng Kulon 930a</p>
            <p>Contact: 081654979684</p>
        </div>
        <button class="btn btn-login" onclick="window.location.href='/login'">Login</button>
        <button class="btn btn-register" onclick="window.location.href='/register'">Register</button>
    </div>

</body>
</html>
