<%--
/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
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
--%>

<%@ include file="/html/portlet/css_init.jsp" %>

.lfr-theme-list {
	h3 {
		background: #D3DADD;
		padding: 0.5em;
	}

	li {
		float: left;
		margin: 0 1.3em 1.3em 0;
		text-align: center;
	}
}

.theme-title {
	display: block;
	font-weight: bold;
	margin: 0;
	padding: 2px;

	.aui-field-content {
		margin: 0;
	}
}

.lfr-current-theme {
	background: #F0F5F7;
	border: 1px solid #828F95;
	margin-bottom: 1em;
	padding: 3px 3px 1em;

	h3 {
		margin: 0 0 0.5em;
	}

	.selected-theme {
		border-bottom: 1px solid #CCC;
		font-size: 1.5em;

		.aui-field-content {
			display: inline-block;
		}
	}


	.theme-details {
		padding: 0 2px 0 170px;
	}

	.theme-fields {
		margin-left: 0.5em;
	}

	.theme-screenshot {
		border: 1px solid #CCC;
		float: left;
		height: 120px;
		margin: 0 0.5em;
		width: 150px;
	}
}

.theme-entry {
	cursor: pointer;
	float: left;
	height: 96px;
	margin: 2px;
	padding: 0.3em;
	text-align: center;
	text-decoration: none;

	&:hover {
		&, & label {
			color: #369;
		}

		.theme-thumbnail {
			border-color: #369;
		}
	}
}

.theme-thumbnail {
	border: 1px solid #CCC;
	height: 68px;
	width: 85px;
}

.lfr-available-themes {
	h3 {
		margin: 0;
		overflow: hidden;
	}

	.lfr-theme-list {
		margin-top: 0.7em;
	}

	.header-title {
		float: left;
	}

	.install-themes {
		float: right;
		font-size: 11px;
	}
}

.lfr-theme-list .theme-details dd {
	margin: 0;
}

.theme-details {
	dl {
		margin-bottom: 1em;
	}

	dt {
		font-weight: bold;
		margin-top: 1em;
	}
}

.color-schemes {
	clear: both;

	.lfr-panel-content {
		overflow: hidden;
	}
}

.selected-color-scheme img {
	border: 3px solid #369;
}

.rule-group-instance-container {
	.rule-group-instance {
		border-bottom: 1px solid #D7D7D7;
		cursor: move;
		display: block;
		margin: 3px 0;
		padding: 10px;

		.rule-group-instance-handle {
			float: left;
		}

		.rule-group-instance-priority {
			float: right;
		}
	}

	.rule-group-instance:hover {
		background-color: #F5F8FB;
	}
}

.rule-group-instance-container.yui3-dd-drop-active-valid .rule-group-instance-priority {
	display: none;
}

.rule-group-instance-dragging {
	background-color: #F5F8FB;
	height: 18px !important;
	width: 402px !important;

	.rule-group-instance-priority {
		display: block !important;
	}
}

.rule-group-instance-dragging:hover {
	background-color: #F5F8FB;
}