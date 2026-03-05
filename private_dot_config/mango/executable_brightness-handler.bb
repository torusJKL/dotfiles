#!/home/linuxbrew/.linuxbrew/bin/bb

(require '[clojure.string :as str]
         '[clojure.java.shell :refer [sh]])

(def brightness-file "/tmp/sway_brightness")

(defn get-brightness [device]
  (let [{:keys [out]} (sh "brightnessctl" "-d" device "get")]
    (Integer/parseInt (str/trim out))))

(defn set-brightness [device value]
  (sh "sudo" "brightnessctl" "-d" device "set" (str value)))

(defn save-brightness [device]
  (let [current (get-brightness device)]
    (spit brightness-file (str current))
    (set-brightness device 30)))

(defn restore-brightness [device]
  (let [saved (slurp brightness-file)]
    (when (and saved (not= saved ""))
      (set-brightness device (Integer/parseInt (str/trim saved))))))

(defn -main [& args]
  (let [device (first args)
        action (second args)]
    (case action
      "save" (save-brightness device)
      "restore" (restore-brightness device)
      (println "Usage: brightness-handler.bb <device> {save|restore}"))))

(apply -main *command-line-args*)
