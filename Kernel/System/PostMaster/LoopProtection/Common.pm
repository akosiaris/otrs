# --
# Copyright (C) 2001-2016 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
package Kernel::System::PostMaster::LoopProtection::Common;
## nofilter(TidyAll::Plugin::OTRS::Perl::Time)

use strict;
use warnings;
use utf8;

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get config options
    $Self->{PostmasterMaxEmails} = $Kernel::OM->Get('Kernel::Config')->Get('PostmasterMaxEmails') || 40;
    $Self->{PostmasterMaxEmailsPerAddress} =
        $Kernel::OM->Get('Kernel::Config')->Get('PostmasterMaxEmailsPerAddress') || {};

    my $DateTimeObject = $Kernel::OM->Create('Kernel::System::DateTime');
    $Self->{LoopProtectionDate} = $DateTimeObject->Format( Format => '%Y-%m-%d' );

    return $Self;
}

1;
