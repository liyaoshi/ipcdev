/*
 * Copyright (c) 2013-2015 Texas Instruments Incorporated - http://www.ti.com
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

/*
 *  ======== NotifyCircSetup.xs ========
 */

/*
 *  ======== module$use ========
 */
function module$use()
{
    xdc.useModule('xdc.runtime.Assert');

    this.$logWarning("This module has been deprecated. To eliminate "
        + "this warning, remove \"xdc.useModule('" + this.$name + "')\" "
        + "from your application configuration script. The correct "
        + "setup module for notify will be included automatically.", this);

    /*  If the Notify module was used, assume that this module was assigned
     *  as the delegate for the setup proxy. Override that assignment with
     *  the correct delegate.
     */
    var modName = "ti.sdo.ipc.Notify";

    if (modName in xdc.om) {
        var Notify = xdc.module(modName);
        if (Notify.$used) {
            Notify.SetupProxy =
                    xdc.useModule('ti.sdo.ipc.family.tci663x.NotifyCircSetup');
        }
    }

    if (this.$written("dspIntVectId")) {
        this.$logWarning("The configuration parameter 'dspIntVectId' has "
            + "been deprecated. To specify the CPU interrupt number for "
            + "IPC, please refer to the interrupt delegate.", this);
    }
}
