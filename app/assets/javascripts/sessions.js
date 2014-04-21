// I don't like coffee scripts because they are UGLY!
// Use decent JS instead
$(document).ready(function() {
	
	switch (location.pathname) {
	case "/sessions/new":
		recaptcha_preview();
		break;
	default:
		break;
	}
});
