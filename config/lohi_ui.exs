import Config

config :phoenix, :json_library, Jason

config :lohi_ui, LohiUiWeb.Endpoint,
  url: [host: "looniebox.local"],
  http: [port: 80],
  secret_key_base: "I40cUG6cqA15XsNa4tajPdhdrw5JQq5PXES2kW5ypR7IFVfta5JlXSSJ9JR+JLos",
  root: Path.dirname(__DIR__),
  server: true,
  render_errors: [view: LohiUiWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: LohiUi.PubSub,
  code_reloader: false,
  cache_static_manifest: "priv/static/cache_manifest.json"

config :lohi_ui,
  max_volume: 80,
  music_directory: "/root/mpd/music",
  playlist_directory: "/root/mpd/playlists",
  load_callback: &Looniebox.Lights.flash/0,
  volume_change_callback: &Looniebox.Lights.volume/1,
  success_callback: &Looniebox.Lights.blink/0
