variable "USERNAME" {
    default = "ashleykza"
}

variable "APP" {
    default = "fooocus"
}

variable "RELEASE" {
    default = "2.3.1"
}

variable "CU_VERSION" {
    default = "118"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["${USERNAME}/${APP}:${RELEASE}"]
    args = {
        RELEASE = "${RELEASE}"
        BASE_IMAGE = "ashleykza/runpod-base:1.0.0-cuda11.8.0-torch2.1.2"
        INDEX_URL = "https://download.pytorch.org/whl/cu${CU_VERSION}"
        TORCH_VERSION = "2.1.2+cu${CU_VERSION}"
        XFORMERS_VERSION = "0.0.23.post1+cu${CU_VERSION}"
        FOOOCUS_VERSION = "2.3.1"
        CIVITAI_DOWNLOADER_VERSION = "2.1.0"
        VENV_PATH = "/workspace/venvs/fooocus"
    }
}
