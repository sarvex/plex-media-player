include(FetchDependencies)

option(WEB_CLIENT_TV_OLD "" OFF)
option(WEB_CLIENT_DISABLE_DESKTOP "" OFF)

set(WEB_CLIENT_BUILD_NUMBER 22)
set(DESKTOP_VERSION 3.35.1-1450ec9)
set(TVOLD_VERSION 3.13.3-5401c32)
set(TV_VERSION 3.36.0-e0532781)

if(WEB_CLIENT_TV_OLD)
  set(TV_VERSION ${TVOLD_VERSION})
endif()

if(NOT WEB_CLIENT_DISABLE_DESKTOP)
  download_deps("web-client-desktop"
                BUILD_NUMBER ${WEB_CLIENT_BUILD_NUMBER}
                VARIANT ${DESKTOP_VERSION}
                NO_HASH_FILE
                ARCHSTR "universal"
                BASE_URL "https://artifacts.plex.tv/web-client-pmp/${WEB_CLIENT_BUILD_NUMBER}"
                DIRECTORY WEB_DESKTOP_DIR
  )
endif()

download_deps("web-client-tv"
              BUILD_NUMBER ${WEB_CLIENT_BUILD_NUMBER}
              VARIANT ${TV_VERSION}
              NO_HASH_FILE
              ARCHSTR "universal"
              BASE_URL "https://artifacts.plex.tv/web-client-pmp/${WEB_CLIENT_BUILD_NUMBER}"
              DIRECTORY WEB_TV_DIR
)
