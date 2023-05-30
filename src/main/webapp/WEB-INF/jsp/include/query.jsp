<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    
    <head>
        <div id="query" class="offset">
            <div class="container-fluid">
                <div class="col-12 text-center">
                    <h3 class="heading">EMAIL US</h3>
                    <div class="heading-underline"></div>
                </div>
    </head>
    
    <body>
        
                <form class="container query-form" id="sendEmailForm" method="post"
			action="/emailForm">
                    <div class="form-row">
                        <div class="form-group col-md-4 col-lg-4">
                            <label for="mailTo">Mail to</label>
                            <input type="text" id="receiverMail" class="form-control" placeholder="Receiver's Email">
                        </div>
                        <div class="form-group col-md-4 col-lg-4">
                            <label for="subject">Subject</label>
                            <input type="text" id="mailSubject" class="form-control" placeholder="Subject">
                        </div>
                    </div>
                    <div class="form-group col-12-md">
                        <label for="message">Message</label>
                        <textarea id="mailMessage" class="form-control" rows="5" placeholder="Query"></textarea>
                    </div>

                    <button type="submit" id="sendEmailBtn" class="btn btn-primary">Send Email</button>
                </form>
            </div>
        </div>
    </body>
</html>