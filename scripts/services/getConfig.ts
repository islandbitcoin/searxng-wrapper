// To utilize the default config system built, this file is required. It defines the *structure* of the configuration file. These structured options display as changeable UI elements within the "Config" section of the service details page in the Embassy UI.

import { compat, types as T } from "../deps.ts";

export const getConfig: T.ExpectedExports.getConfig = compat.getConfig({
    "tor-address": {
      "name": "Tor Address",
      "description": "The Tor address of the network interface",
      "type": "pointer",
      "subtype": "package",
      "package-id": "searxng",
      "target": "tor-address",
      "interface": "main",
    },
    "lan-address": {
      "name": "LAN Address",
      "description": "The LAN address of the network interface",
      "type": "pointer",
      "subtype": "package",
      "package-id": "searxng",
      "target": "lan-address",
      "interface": "main",
    },
    "tor-only": {
      "name": "Enable Tor",
      "description": "Enables your search engine on the Tor Network.",
      "type": "boolean",
      "default": false,
    },
    "autocomplete": {
      "name": "Enable Autocomplete",
      "description": "Turns on autocomplete when using SearXNG. This will send data to your Embassy while typing, before pressing the search button",
      "type": "boolean",
      "default": false,
    },
    "enable-metrics": {
      "name": "Enable Metrics",
      "description": "Turns on data collection for search metrics when using SearXNG.",
      "type": "boolean",
      "default": false,
    } //,
    // "email-address": {
    //   "type": "string",
    //   "name": "Email Address",
    //   "description": "Your Email address - required to create an SSL certificate.",
    //   "nullable": false,
    //   "default": "youremail@domain.com",
    // },
    // "public-host": {
    //   "type": "string",
    //   "name": "Public Domain Name",
    //   "description": "Enter a domain name here if you want to share your SearXNG engine publicly. You will also need to modify your domain name's DNS settings to point to your Embassy.",
    //   "nullable": true,
    //   "placeholder": "https://search.mydomain.com"
    // }
});
