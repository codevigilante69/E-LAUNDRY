<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="index.css">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
</head>
<body class="main">
<div class="main_container">
    <div class="top_head_style">
        <p class="main_heading">
                <span>
                    <img src="index/thaparlogo.png" alt="" class="main_heading_image">
                </span>

                <span>
                    R.S Dry Cleaners
                </span>
        </p>
    </div>
    <div class="middle">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <img src="index/mainlogo.png" class="page_photo1" alt="">
                    <p class="small_line">Your one Stop Destination for laundry Service In TU</p>
                </div>

                <div class="col-sm-6">

                    <form class="contain_form form_font"  action="registeraction.jsp" method="post">
                        <h3 class="login_heading">Sign Up</h3>

                        <hr>

                        <div class="form-group">
                            <label for="Name" class="form-labels">Name</label>
                            <input type="text" class="form-control form-group-members" name="Username"id="userName" placeholder="Name" required="">
                        </div>
                        <div class="form-group">
                            <label for="userEmail" class="form-labels">Email</label>
                            <input type="email" class="form-control form-group-members" id="userEmail" name="Email" placeholder="Email" required="">
                        </div>
                        <div class="form-group">
                            <label for="userMobilenumber" class="form-labels">Mobile Number</label>
                            <input type="text" class="form-control form-group-members" id="userMobilenumber" name="Mobile" placeholder="Mobile Number" required="" pattern="[7-9][0-9]{9}">
                        </div>
                        <div class="form-group">
                            <label for="rollNum" class="form-labels">Roll Number</label>
                            <input type="text" class="form-control form-group-members" id="rollNum" placeholder="Roll Number" name="Roll_No." required="" pattern="[0-9]{9}" maxlength="9">
                        </div>
                        <div class="form-group">
                            <label for="InputPassword1" class="form-labels">Password</label>
                            <input type="password" class="form-control form-group-members" id="InputPassword1" name="Password" placeholder="Password" required="" pattern="[0-9a-zA-Z]{6,10}">
                        </div>
                        <div class="form-group">
                            <label for="retypeInputPassword1" class="form-labels">Retype Password</label>
                            <input type="password" class="form-control form-group-members" id="retypeInputPassword1" name="RPassword" placeholder="Password" required="" pattern="[0-9a-zA-Z]{6,10}">
                        </div>
                        <div class="form-group">
                            <label for="userHostel">Hostel</label>
                            <select name="Hostel" id="userHostel">
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                                <option value="E">E</option>
                                <option value="F">F</option>
                                <option value="G">G</option>
                                <option value="H">H</option>
                                <option value="I">I</option>
                                <option value="J">J</option>
                                <option value="K">K</option>
                                <option value="L">L</option>
                                <option value="M">M</option>
                                <option value="N">N</option>
                                <option value="FRC">FRC</option>
                                <option value="Others">Others</option>
                            </select>
                            <div class="form-group">
                                <label for="userRoomno" class="form-group">Room Number</label>
                                <input type="text" class="form-control form-group-members" id="userRoomno" name="Room_No."placeholder="Room Number" required maxlengtht="10">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="userClass"></label>
                        </div>
                        <p class=""><a href="index.jsp" class="btn btn-danger">Login</a></p>

                        <button type="submit" class="btn btn-success btn-lg">Sign Up</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="Bottom">
        <p>All Rights Reserved  R.S Dry Clean</p>
    </div>
</div>
</body>
</html>