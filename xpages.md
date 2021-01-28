Prevent Dojo from loading - in `xsp.properties`:

    xsp.client.script.libraries=none
	
Prevent Dojo from loading on a single XPage - add call to `blockDojo` in `beforePageLoad` event:

    function blockDojo() {
        facesContext.getRequestParameters().setJsLibrary(0);    
    }

