declare namespace chrome {
  namespace webRequest {
    interface WebRequestHeadersDetails {
      requestId: string;
      method: string;
      url: string;
      requestHeaders?: chrome.webRequest.HttpHeaders;
    }

    interface HttpHeaders {
      name: string;
      value: string;
    }

    function onBeforeSendHeadersListener(
      listener: (details: WebRequestHeadersDetails) => void,
      filter: { urls: string[] },
      extraInfoSpec?: string[]
    ): void;


    function onCompletedListener(
      listener: (details: WebRequestBodyDetails) => void,
      filter: { urls: string[] }
    ): void;
  }

  namespace downloads {
    interface DownloadOptions {
      url: string;
      filename?: string;
      conflictAction?: string;
    }

    function download(options: DownloadOptions): void;
  }
}
