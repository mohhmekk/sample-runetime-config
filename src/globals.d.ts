export interface Env {
    DEPLOYMENT_ENV: string
}

declare global {
    export interface Window {
        _env_: Env
    }
}