<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://unpkg.com/lottie-web@5.12.0/build/player/lottie.min.js"></script>
<style>
    body, html {
        height: 100%;
        margin: 0;
        font-family: 'Inter', sans-serif;
        background: linear-gradient(180deg, #f5f7fa 0%, #c3cfe2 100%);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .main-wrapper {
        display: flex;
        width: 100%;
        height: 100vh;
    }

    #lottie-animation {
        flex: 2;
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 1;
    }

    .container {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 1rem;
        z-index: 10;
    }

    .form-container {
        width: 100%;
        background: #fcffff;
        border-radius: 20px;
        padding: 3rem 2.5rem;
        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border: 2px solid #fe980f;
    }

    .form-container:hover {
        transform: translateY(-8px);
        box-shadow: 0 15px 50px rgba(0, 0, 0, 0.25);
    }

    .form-container h3 {
        color: #2c3e50;
        font-weight: 700;
        font-size: 2rem;
        letter-spacing: 1.2px;
        margin-bottom: 2.5rem;
        text-transform: uppercase;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
    }

    .form-floating .form-control {
        border-radius: 10px;
        border: 2px solid #fe980f;
        padding: 1rem;
        height: calc(3.5rem + 2px);
        background: #fdfdfd;
        transition: all 0.3s ease;
    }

    .form-floating .form-control:focus {
        border-color: #f85506;
        box-shadow: 0 0 10px rgba(248, 85, 6, 0.4);
        background: #ffffff;
    }

    .form-floating label {
        color: #6c757d;
        padding: 1rem;
        font-weight: 500;
    }

    .form-floating label i {
        color: #fe980f;
    }

    .btn-login {
        background: linear-gradient(90deg, #fe980f, #f85506);
        color: #fcffff;
        border: none;
        padding: 14px;
        border-radius: 10px;
        font-weight: 600;
        font-size: 1.1rem;
        text-transform: uppercase;
        letter-spacing: 1.5px;
        transition: all 0.3s ease;
        width: 100%;
    }

    .btn-login:hover {
        background: linear-gradient(90deg, #e61616, #f85506);
        transform: translateY(-3px);
        box-shadow: 0 5px 15px rgba(230, 22, 22, 0.4);
    }

    .btn-login i {
        margin-right: 10px;
    }

    @media (max-width: 768px) {
        .main-wrapper {
            flex-direction: column;
        }

        #lottie-animation {
            width: 100%;
            height: 50%;
            flex: unset;
        }

        .container {
            width: 100%;
            height: 50%;
            flex: unset;
        }

        .form-container {
            padding: 2rem 1.5rem;
        }

        .form-container h3 {
            font-size: 1.6rem;
        }

        .btn-login {
            padding: 12px;
            font-size: 1rem;
        }
    }
</style>

<body>
    <div class="main-wrapper">
        <!-- Lottie Animation Container -->
        <div id="lottie-animation"></div>

        <!-- Login Form -->
        <div class="container">
            <div class="form-container">
                <form method="post" action="Admin_Login">
                    <h3 class="text-center">Admin Login</h3>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="username" id="username" placeholder="Username" required>
                        <label for="username"><i class="fas fa-user me-2"></i>Username</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                        <label for="password"><i class="fas fa-lock me-2"></i>Password</label>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-login"><i class="fas fa-sign-in-alt"></i>Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Scripts remain the same -->
    <script>
        lottie.loadAnimation({
            container: document.getElementById('lottie-animation'),
            renderer: 'svg',
            loop: true,
            autoplay: true,
            path: '<%=request.getContextPath()%>/admin/Adminassets/Animation/admin_login_ani.json'
        });
    </script>
</body>


</html>