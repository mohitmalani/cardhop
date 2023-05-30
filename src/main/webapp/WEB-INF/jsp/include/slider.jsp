<%@taglib uri="http://www.springframework.org/tags" prefix="u" %>

        <div id="carouselExampleIndecator" class="carousel slide" data-ride="carousel" data-interval="3500">

            <div class="carousel-inner" role="listbox">

                <div class="carousel-item active"
                    style="background-image:linear-gradient(rgba(0,0,0,0.2),rgba(0,0,0,0.5)),url('./static/images/slide_1.png');">
                    <div class="carousel-caption text-left">
                        <h1>Create your account now 2 be always CONNECTED</h1>
                        <p>Start adding your connections</p>
                    </div>
                </div>

                <div class="carousel-item "
                    style="background-image:linear-gradient(rgba(0,0,0,0.2),rgba(0,0,0,0.5)), url('./static/images/slide_2.jpeg');">
                    <div class="carousel-caption text-left">
                        <h1>Manage your Contacts</h1>
                        <p>Do CRUD Operations</p>
                    </div>
                </div>

                
            </div>
            
            <ul class="carousel-indicators">
                <li data-target="#carouselExampleIndecator" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndecator" data-slide-to="1"></li>
            </ul>
        </div>