<%@ page import="com.wifi.publicwifilocator.service.BookmarkService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wifi.publicwifilocator.entity.BookmarkGroup" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  request.setCharacterEncoding("UTF-8");
  String bookmarkGroupIdParam = request.getParameter("bookmark_group_id");
  if (bookmarkGroupIdParam == null || bookmarkGroupIdParam.isEmpty()) {
    BookmarkService bookmarkService = new BookmarkService();
    ArrayList<BookmarkGroup> bookmarkGroups = bookmarkService.getBookmarkGroups();
    if (bookmarkGroups.isEmpty()) {
%>
<script>
  alert('북마크 그룹을 먼저 생성해주세요.');
  location.href = 'bookmark-group.jsp';
</script>
<%
} else {
%>
<script>
  alert("북마크 그룹을 선택해주세요.");
  history.go(-1);
</script>
<%
  }
} else {
  int bookmarkGroupId = Integer.parseInt(bookmarkGroupIdParam);
  String mgrNo = request.getParameter("mgrNo");
  BookmarkService bookmarkService = new BookmarkService();
  if (bookmarkService.addBookmark(bookmarkGroupId, mgrNo)) {
%>
<script>
  alert("북마크 정보를 추가하였습니다.");
  location.href = "bookmark-list.jsp";
</script>
<%
    }
  }
%>