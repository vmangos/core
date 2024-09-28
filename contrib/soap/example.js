/*!
 * Copyright (C) 2024-present  VMaNGOS  https://github.com/vmangos
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

// Using https://www.npmjs.com/package/soap does not work because it expects
// a WSDL file, which we don't have. Instead, we can use a regular HTTP client
// (like the native `fetch` API which is stable since Node.js v21) to construct
// and send SOAP requests manually.

// Optional:
// We can replace XML entities with their respective characters by installing
// https://www.npmjs.com/package/entities:
// const entities = require('entities')

const username = 'ADMINISTRATOR'
const password = 'ADMINISTRATOR'
const host = 'localhost'
const port = 7878
const command = 'server info'

const buildSoapRequest = command => `
  <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="urn:MaNGOS">
    <SOAP-ENV:Body>
      <ns1:executeCommand>
        <command>${command}</command>
      </ns1:executeCommand>
    </SOAP-ENV:Body>
  </SOAP-ENV:Envelope>
`

const soapRequest = buildSoapRequest(command)

;(async () => {
  try {
    const response = await fetch(`http://${host}:${port}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'text/xml',
        'SOAPAction': 'urn:MaNGOS',
        'Authorization': 'Basic ' + Buffer.from(`${username}:${password}`).toString('base64')
      },
      body: soapRequest
    })

    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`)
    }

    const rawResult = await response.text()

    if (response.status !== 200) {
      console.warn(`Unexpected status code: ${response.status}`)
      console.warn('Raw output:', rawResult)
      return
    }

    const resultBeginIdx = rawResult.indexOf('<result>') + '<result>'.length
    const resultEndIdx = rawResult.lastIndexOf('</result>')
    let result = rawResult.slice(resultBeginIdx, resultEndIdx)
    // If we chose to install the `entities` package, we can decode XML
    // entities:
    // result = entities.decodeXML(result)

    console.log('Command succeeded! Output:', result)
  } catch (error) {
    console.error('Command failed! Reason:', error.message)
  }
})()
