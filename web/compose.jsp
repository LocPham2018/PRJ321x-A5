<%-- 
    Document   : compose
    Created on : Oct 4, 2019, 4:06:40 PM
    Author     : AMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.user == null}">
    <c:redirect url="/login.jsp" />
</c:if>
<c:import url="components/nav.jsp">
    <c:param name="headTitle" value="New Mail" />
</c:import>
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<script>
    tinymce.init({
        selector: 'textarea',
        plugins: [
            "advlist autolink link image lists charmap print preview hr anchor pagebreak",
            "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
            "save table contextmenu directionality emoticons template paste textcolor"
        ],
        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons",
        style_formats: [
            {title: "Headers", items: [
                    {title: "Header 1", format: "h1"},
                    {title: "Header 2", format: "h2"},
                    {title: "Header 3", format: "h3"},
                    {title: "Header 4", format: "h4"},
                    {title: "Header 5", format: "h5"},
                    {title: "Header 6", format: "h6"}
                ]},
            {title: "Inline", items: [
                    {title: "Bold", icon: "bold", format: "bold"},
                    {title: "Italic", icon: "italic", format: "italic"},
                    {title: "Underline", icon: "underline", format: "underline"},
                    {title: "Strikethrough", icon: "strikethrough", format: "strikethrough"},
                    {title: "Superscript", icon: "superscript", format: "superscript"},
                    {title: "Subscript", icon: "subscript", format: "subscript"},
                    {title: "Code", icon: "code", format: "code"}
                ]},
            {title: "Blocks", items: [
                    {title: "Paragraph", format: "p"},
                    {title: "Blockquote", format: "blockquote"},
                    {title: "Div", format: "div"},
                    {title: "Pre", format: "pre"}
                ]},
            {title: "Alignment", items: [
                    {title: "Left", icon: "alignleft", format: "alignleft"},
                    {title: "Center", icon: "aligncenter", format: "aligncenter"},
                    {title: "Right", icon: "alignright", format: "alignright"},
                    {title: "Justify", icon: "alignjustify", format: "alignjustify"}
                ]}
        ]
    });
</script>
<form action="/PRJ321x-A5/sendProcess" method="post">
    <p class="mb-0 mt-3">From: <span class="text-danger"><c:out value="${sessionScope.mailfromMessage}" /></span></p>
    <input type="email" name="emailFrom" class="w-100" />
    <p class="mb-0 mt-3">Password: <span class="text-danger"><c:out value="${sessionScope.passwordMessage}" /></span></p>
    <input type="password" name="password" class="w-100" />
    <p class="mb-0 mt-3">To: <span class="text-danger"><c:out value="${sessionScope.mailtoMessage}" /></span></p>
    <input type="email" name="emailTo" class="w-100" multiple />
    <p class="mb-0 mt-3">Cc:</p>
    <input type="email" name="emailCc" class="w-100" multiple />
    <p class="mb-0 mt-3">Subject:</p>
    <input type="text" name="subject" class="w-100" />
    <p class="mb-0 mt-3">Contents: <span class="text-danger"><c:out value="${sessionScope.contentsMessage}" /></span></p>
    <textarea name="contents"></textarea>
    <input type="submit" value="Send" class="btn btn-primary my-3" />
</form>
<c:set scope="session" var="mailfromMessage" value="${null}" />
<c:set scope="session" var="passwordMessage" value="${null}" />
<c:set scope="session" var="mailtoMessage" value="${null}" />
<c:set scope="session" var="contentsMessage" value="${null}" />
<c:import url="components/footer.jsp" />