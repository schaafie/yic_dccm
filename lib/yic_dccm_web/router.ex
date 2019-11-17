defmodule YicDccmWeb.Router do
  use YicDccmWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", YicDccmWeb do
    pipe_through :browser

    get "/", HomepageController, :index
    resources "/users", UserController
    resources "/roles", RoleController
    resources "/members", MemberController
    resources "/contentelements", ContentElementController
    resources "/contentbasetypes", ContentBasetypeController
    resources "/contenttypes", ContentTypeController
    resources "/contenttemplates", ContentTemplateController
    resources "/contenttargets", ContentTargetController
    resources "/contentpublications", ContentPublicationController
    resources "/sites", SiteController
    resources "/sitetargets", SiteTargetController
    resources "/sitepublications", SitePublicationController
    resources "/pages", PageController
    resources "/pagelayouts", PageLayoutController
    resources "/websnippets", WebSnippetController
    resources "/visualcomponents", VisualComponentController
    resources "/functionalcomponents", FunctionalComponentController
  end

  scope "/api", YicDccmWeb do
    pipe_through :api

    resources "/contenttypes", Api.ContentTypeController
    get "/allcontenttypes", Api.ContentSupportTypeController, :index

  end

end
