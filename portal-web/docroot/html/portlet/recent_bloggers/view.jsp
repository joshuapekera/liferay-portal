<%
/**
 * Copyright (c) 2000-2010 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ include file="/html/portlet/recent_bloggers/init.jsp" %>

<%
List statsUsers = null;

if (selectionMethod.equals("users")) {
	if (organizationId > 0) {
		statsUsers = BlogsStatsUserLocalServiceUtil.getOrganizationStatsUsers(organizationId, 0, max, new StatsUserLastPostDateComparator());
	}
	else {
		statsUsers = BlogsStatsUserLocalServiceUtil.getCompanyStatsUsers(company.getCompanyId(), 0, max, new StatsUserLastPostDateComparator());
	}
}
else {
	statsUsers = BlogsStatsUserLocalServiceUtil.getGroupStatsUsers(themeDisplay.getScopeGroupId(), 0, max);
}
%>

<c:choose>
	<c:when test="<%= statsUsers.isEmpty() %>">
		<liferay-ui:message key="there-are-no-recent-bloggers" />
	</c:when>
	<c:otherwise>

		<%
		SearchContainer searchContainer = new SearchContainer();

		List<String> headerNames = new ArrayList<String>();

		headerNames.add("user");
		//headerNames.add("place");
		headerNames.add("posts");
		headerNames.add("date");

		if (displayStyle.equals("user-name")) {
			searchContainer.setHeaderNames(headerNames);
		}

		List resultRows = searchContainer.getResultRows();

		for (int i = 0; i < statsUsers.size(); i++) {
			BlogsStatsUser statsUser = (BlogsStatsUser)statsUsers.get(i);

			try {
				Group group = GroupLocalServiceUtil.getGroup(statsUser.getGroupId());
				User user2 = UserLocalServiceUtil.getUserById(statsUser.getUserId());

				String blogType = LanguageUtil.get(pageContext, "personal");

				if (group.isCommunity()) {
					blogType = group.getName();// + " " + LanguageUtil.get(pageContext, "community");
				}
				else if (group.isOrganization()) {
					Organization organization = OrganizationLocalServiceUtil.getOrganization(group.getClassPK());

					blogType = organization.getName();// + " " + LanguageUtil.get(pageContext, "organization");
				}

				int entryCount = BlogsEntryLocalServiceUtil.getGroupUserEntriesCount(group.getGroupId(), user2.getUserId(), StatusConstants.APPROVED);

				List entries = BlogsEntryLocalServiceUtil.getGroupUserEntries(group.getGroupId(), user2.getUserId(), StatusConstants.APPROVED, 0, 1);

				if (entries.size() == 1) {
					BlogsEntry entry = (BlogsEntry)entries.get(0);

					StringBundler sb = new StringBundler(4);

					sb.append(themeDisplay.getPathMain());
					sb.append("/blogs/find_entry?entryId=");
					sb.append(entry.getEntryId());
					sb.append("&showAllEntries=1");

					String rowHREF = sb.toString();

					ResultRow row = new ResultRow(new Object[] {statsUser, rowHREF}, statsUser.getStatsUserId(), i);

					if (displayStyle.equals("user-name")) {

						// User

						row.addText(HtmlUtil.escape(user2.getFullName()), rowHREF);

						// Type

						//row.addText(blogType, rowHREF);

						// Number of posts

						row.addText(String.valueOf(entryCount), rowHREF);

						// Last post date

						row.addText(dateFormatDate.format(entry.getModifiedDate()), rowHREF);
					}
					else {

						// User display

						row.addJSP("/html/portlet/recent_bloggers/user_display.jsp");
					}

					// Add result row

					resultRows.add(row);
				}
			}
			catch (Exception e) {
			}
		}
		%>

		<liferay-ui:search-iterator searchContainer="<%= searchContainer %>" paginate="<%= false %>" />
	</c:otherwise>
</c:choose>